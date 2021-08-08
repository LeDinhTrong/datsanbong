import 'dart:convert';

import '../models/models.dart';
import '../helper/dioulti.dart';

class R800BookingProvider {
  /**                                                                                                                  
   * R800BookingProvider                                                                     
   */
  R800BookingProvider() {
    DioUtil.tokenInter();
  }

  /**                                                                                                                  
   *                                                                                                                   
   */
  Future<dynamic> p800Booking(int what, Map<String, dynamic> param) async {
    param['what'] = what;

    switch (what) {
      // Get all data from Booking
      case 800:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Insert data to Booking
      case 801:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          print("AuthenticationService authWithToken $e");
          throw e;
        }
        break;

      // Delete data
      case 803:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          print("AuthenticationService authWithToken $e");
          throw e;
        }
        break;

      // Update data Booking
      case 802:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Delete data of Booking
      case 803:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with id Booking
      case 804:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Select with pagination(offset, number-item-in-page) Booking
      case 805:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Count number item of Booking
      case 806:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with Field_Id
      case 807:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with User_Id
      case 808:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
          } else {
            throw Exception(result['error']);
          }
        } catch (e) {
          throw e;
        }
        break;

      // Find data with User_Id
      case 809:
        try {
          final response = await DioUtil.post(param);
          Map<String, dynamic> result = jsonDecode(response.toString());
          if (result['status'] == true) {
            return List<M800BookingModel>.from(result['data']
                .map((model) => M800BookingModel.fromJson(model)));
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
