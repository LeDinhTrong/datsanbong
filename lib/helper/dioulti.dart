import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'ulti.dart';

const httpHeaders = {
  'Accept': 'application/json, text/plain, */*',
  'Content-Type': 'application/json;charset=UTF-8',
};

class DioUtil {
  static Dio dio = new Dio();

  DioUtil() {
    checkConnect();
  }

  static checkConnect() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Not have internet connected');
      }
    } on SocketException catch (_) {
      throw Exception("Not have internet");
    }
  }

  // Request section
  static Future get(url, {queryParameters}) async {
    try {
      Response response;
      dio.options.headers = httpHeaders;

      response = await dio.get(Ulti.BASE_URL_API + url,
          queryParameters: queryParameters);

      if (checkStatusCodeSuccess(response.statusCode!)) {
        return response;
      } else {
        throw Exception("Dio Interface exception R");
      }
    } on DioError catch (e) {
      print("Dio get error ${e.response}");
      if (e.response != null) {
        // print('e.response ${e.response}');
        // print('e.response ${e.response?.statusMessage}');
        Map<String, dynamic> res = jsonDecode(e.response.toString());
        // print('err res $res');
        if (res['message'] != null) {
          throw res['message'];
        } else if (res['error'] != null) {
          if (res['error']['errors'] != null) {
            if (res['error']['errors'][0] != null) {
              if (res['error']['errors'][0]['message'] != null) {
                throw Exception(res['error']['errors'][0]['message']);
              } else {
                throw Exception('Unknow error dio exception post');
              }
            } else {
              throw Exception('Unknow error dio exception post');
            }
          } else {
            throw Exception(res['error']['message']);
          }
        }
      } else {
        print("Dio get error message ${e.message}");
        throw Exception(e.message.toString());
      }
    }
  }

  // Request section
  static Future delete(url, {queryParameters}) async {
    try {
      Response response;
      dio.options.headers = httpHeaders;

      response = await dio.delete(Ulti.BASE_URL_API + url,
          queryParameters: queryParameters);

      if (checkStatusCodeSuccess(response.statusCode!)) {
        return response;
      } else {
        throw Exception("Dio Interface exception R");
      }
    } on DioError catch (e) {
      print("Dio get error ${e.response}");
      if (e.response != null) {
        Map<String, dynamic> res = jsonDecode(e.response.toString());
        if (res['message'] != null) {
          throw res['message'];
        } else if (res['error'] != null) {
          if (res['error']['errors'] != null) {
            if (res['error']['errors'][0] != null) {
              if (res['error']['errors'][0]['message'] != null) {
                throw Exception(res['error']['errors'][0]['message']);
              } else {
                throw Exception('Unknow error dio exception post');
              }
            } else {
              throw Exception('Unknow error dio exception post');
            }
          } else {
            throw Exception(res['error']['message']);
          }
        }
      } else {
        print("Dio get error message ${e.message}");
        throw Exception(e.message.toString());
      }
    }
  }

  static Future uploadImage(File imageFile, String currentDatetime) async {
    var stream;
    try {
      stream =
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    } catch (exception) {
      print("error");
      return null;
    }

    var length = await imageFile.length();
    var uploadURL =
        "https://api.giadinhsunkun.com/p7fiveSBS/P5Upload/UploadImage.php";
    var uri = Uri.parse(uploadURL);

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("file", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);
    request.fields['current_datetime'] = currentDatetime;

    var response = await request.send();
    if (response.statusCode == 200) {
    } else {}
  }

  static Future uploadFile(file, currentDatetime) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
        "current_datetime": currentDatetime
      });

      Response response;
      var uploadURL =
          "https://api.giadinhsunkun.com/p6bookingcar/P5Upload/UploadFile.php";
      var uri = Uri.parse(uploadURL);

      response = await dio.post(uploadURL, data: formData);

      if (checkStatusCodeSuccess(response.statusCode!)) {
        return response;
      } else {
        throw Exception("Dio Interface exception R");
      }
    } on DioError catch (e) {
      print("Dio upload error $e");
      if (e.response != null) {
        Map<String, dynamic> res = jsonDecode(e.response.toString());
        if (res['message'] != null) {
          throw res['message'];
        } else if (res['error'] != null) {
          if (res['error']['errors'] != null) {
            if (res['error']['errors'][0] != null) {
              if (res['error']['errors'][0]['message'] != null) {
                throw Exception(res['error']['errors'][0]['message']);
              } else {
                throw Exception('Unknow error dio exception post');
              }
            } else {
              throw Exception('Unknow error dio exception post');
            }
          } else {
            throw Exception(res['error']['message']);
          }
        }
      } else {
        print("Dio upload error message ${e.message}");
        throw Exception(e.message.toString());
      }
    }
  }

  // Request section
  static Future post(formData) async {
    try {
      Response response;
      dio.options.headers = httpHeaders;
      response = await dio.post(Ulti.BASE_URL_API, data: formData);

      if (checkStatusCodeSuccess(response.statusCode!)) {
        return response;
      } else {
        throw "Dio Interface exception R";
      }
    } on DioError catch (e) {
      // print("Dio post error $e");
      // print("Dio post error ${e.response}");
      // print("Dio post error ${e.message}");
      if (e.response != null) {
        Map<String, dynamic> res = jsonDecode(e.response.toString());
        // print('error res ${e.response.toString()}');
        print('error res ${res['errors']}');
        if (res['message'] != null) {
          throw res['message'];
        } else if (res['errors'] != null) {
          if (res['errors'] != null) {
            throw res['errors'].toString();
            // if (res['errors'][0] != null) {
            //   if (res['errors'][0]['message'] != null) {
            //     throw res['errors'][0]['message'];
            //   } else {
            //     throw 'Unknow error dio exception post';
            //   }
            // } else {
            //   throw 'Unknow error dio exception post';
            // }
          } else {
            throw res['error']['message'];
          }
        } else if (res['message'] != null) {
          // print('error res ${res['message']}');
          // print("Dio post error message ${e.message}");
          throw res['message'].toString();
        }
      } else {
        throw e;
      }
    }
  }

  // Request section
  static Future put(url, formData) async {
    try {
      Response response;
      dio.options.headers = httpHeaders;
      response = await dio.put(Ulti.BASE_URL_API + url, data: formData);

      if (checkStatusCodeSuccess(response.statusCode!)) {
        return response;
      } else {
        throw Exception("Dio Interface exception R");
      }
    } on DioError catch (e) {
      print("Dio put error $e");
      if (e.response != null) {
        Map<String, dynamic> res = jsonDecode(e.response.toString());
        if (res['message'] != null) {
          throw res['message'];
        } else if (res['error'] != null) {
          if (res['error']['errors'] != null) {
            if (res['error']['errors'][0] != null) {
              if (res['error']['errors'][0]['message'] != null) {
                throw Exception(res['error']['errors'][0]['message']);
              } else {
                throw Exception('Unknow error dio exception post');
              }
            } else {
              throw Exception('Unknow error dio exception post');
            }
          } else {
            throw Exception(res['error']['message']);
          }
        }
      } else {
        print("Dio put error message ${e.message}");
        throw Exception(e.message.toString());
      }
    }
  }

  // Request section
  static Future postLogin(formData) async {
    try {
      Response response;
      dio.options.headers = httpHeaders;
      response = await dio.post(Ulti.BASE_URL_API, data: formData);
      var responseJSON = response.data;
      if (checkStatusCodeSuccess(response.statusCode!) &&
          responseJSON['status']) {
        // print(responseJSON);
        // print(responseJSON['token']);
        // print(responseJSON['profile']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', responseJSON['token']);
        await prefs.setString(
            'user', jsonEncode(responseJSON['profile']).toString());
        return response;
      } else {
        return response;
      }
    } on DioError catch (e) {
      print("Dio post login error $e");
      if (e.response != null) {
        Map<String, dynamic> res = jsonDecode(e.response.toString());
        if (res['message'] != null) {
          throw res['message'];
        } else if (res['error'] != null) {
          if (res['error']['errors'] != null) {
            if (res['error']['errors'][0] != null) {
              if (res['error']['errors'][0]['message'] != null) {
                throw Exception(res['error']['errors'][0]['message']);
              } else {
                throw Exception('Unknow error dio exception post');
              }
            } else {
              throw Exception('Unknow error dio exception post');
            }
          } else {
            throw Exception(res['error']['message']);
          }
        }
      } else {
        print("Dio post login error message ${e.message}");
        throw Exception(e.message.toString());
      }
    }
  }

  static checkStatusCodeSuccess(int statusCode) {
    if (statusCode == 200 || statusCode == 201) return true;
    return false;
  }

  // Interceptor section
  static tokenInter() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options,
        RequestInterceptorHandler requestInterceptorHandler) async {
      // dio.lock();
      dio.interceptors.requestLock.lock();

      Future<dynamic> future = Future(() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString("access_token");
      });
      return future.then((value) {
        if (null != value && value.length > 0) {
          options.headers["Authorization"] = '' + value;
        } else {
          print("Token bearer not found");
        }
        // print('options ${options}');
        // print('options ${options.headers.toString()}');
        requestInterceptorHandler.next(options);
        // return options;
      }).whenComplete(
          () => dio.interceptors.requestLock.unlock()); // unlock the dio
    }, onResponse: (Response response,
        ResponseInterceptorHandler responseInterceptorHandler) {
      // Do some preprocessing before returning the response data
      // return response; // continue
      // print('Dio response ${response}');
      return responseInterceptorHandler.next(response); // continue
    }, onError:
        (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
      // return e; //continue
      // print('Dio error ${error}');
      return errorInterceptorHandler.next(error);
    }));
  }
}
