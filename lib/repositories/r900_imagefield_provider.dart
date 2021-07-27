import 'dart:convert';

import '../models/models.dart';
import '../helper/dioulti.dart';

class R900ImageFieldProvider {
  /**                                                                                                                  
   * R900ImageFieldProvider                                                                     
   */
  R900ImageFieldProvider() {
    DioUtil.tokenInter();
  }

  /**                                                                                                                  
   *                                                                                                                   
   */
  Future<dynamic> p900ImageField(int what, Map<String, dynamic> param) async {
    param['what'] = what;

    switch (what) {
      // Get all data from ImageField
      case 900:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Insert data to ImageField
      case 901:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          print("AuthenticationService authWithToken $e");
          throw e;
        }
        break;

      // Update data ImageField
      case 902:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Delete data of ImageField
      case 903:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with id ImageField
      case 904:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Select with pagination(offset, number-item-in-page) ImageField
      case 905:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Count number item of ImageField
      case 906:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with ImageField_Id
      case 907:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M900ImageFieldModel>.from(result['data']
                .map((model) => M900ImageFieldModel.fromJson(model)));
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
