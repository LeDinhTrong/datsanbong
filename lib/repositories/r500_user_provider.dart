import 'dart:convert';

import '../models/models.dart';
import '../helper/dioulti.dart';

class R500UserProvider {
  /**                                                                                                                  
   * R500UserProvider                                                                     
   */
  R500UserProvider() {
    DioUtil.tokenInter();
  }

  /**                                                                                                                  
   *                                                                                                                   
   */
  Future<dynamic> p500User(int what, Map<String, dynamic> param) async {
    param['what'] = what;

    switch (what) {
      // Get all data from User
      case 500:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Insert data to User
      case 501:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          print("AuthenticationService authWithToken $e");
          throw e;
        }
        break;

      // Update data User
      case 502:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Delete data of User
      case 503:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with id User
      case 504:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Select with pagination(offset, number-item-in-page) User
      case 505:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Count number item of User
      case 506:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Update data User
      case 507:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      //Login
      case 508:
        try {
          final response = await DioUtil.postLogin(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          print('test: ${result}');
          if (result['status'] == true) {
            return List<M500UserModel>.from(
                result['data'].map((model) => M500UserModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
