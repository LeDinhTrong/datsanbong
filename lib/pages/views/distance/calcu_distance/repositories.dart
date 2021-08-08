import 'package:field_for_rent/pages/views/distance/calcu_distance/distance_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Reposi {
  final key = "583694ce13a1cfc74cfa57eb1b747f37";

  Future<DistanceModel> getApi(
      double lat1, double lng1, double lat2, double lng2) async {
    final url = Uri.parse(
        "https://api.map4d.vn/sdk/route?key=$key&origin=$lat1,$lng1&destination=$lat2,$lng2&mode=motorcycle&weighting=2");
    final response = await http.Client().get(url);

    if (response.statusCode == 200) {
      return DistanceModel.fromJson(convert.jsonDecode(response.body));
    } else {
      throw 'Cant get data';
    }
  }
}
