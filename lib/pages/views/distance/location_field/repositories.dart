import 'package:field_for_rent/pages/views/distance/location_field/location_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Repo {
  final key = "583694ce13a1cfc74cfa57eb1b747f37";

  Future<LocationModel> getApi(String address) async {
    final url = Uri.parse(
        "https://api.map4d.vn/sdk/v2/geocode?key=$key&address=$address");
    final response = await http.Client().get(url);
    if (response.statusCode == 200) {
      return LocationModel.fromJson(convert.jsonDecode(response.body));
    } else {
      throw 'Cant get data';
    }
  }
}
