import 'package:field_for_rent/pages/views/distance/location_field/result_location_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_model.g.dart';

@JsonSerializable()
class Result {
  String address;
  ResultLocation location;
  Result(this.address, this.location);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
