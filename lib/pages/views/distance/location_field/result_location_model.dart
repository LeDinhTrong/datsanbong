import 'package:json_annotation/json_annotation.dart';
part 'result_location_model.g.dart';

@JsonSerializable()
class ResultLocation {
  double lat;
  double lng;
  ResultLocation(this.lat, this.lng);
  factory ResultLocation.fromJson(Map<String, dynamic> json) =>
      _$ResultLocationFromJson(json);
  Map<String, dynamic> toJson() => _$ResultLocationToJson(this);
}
