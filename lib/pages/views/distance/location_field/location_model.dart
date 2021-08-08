import 'package:field_for_rent/pages/views/distance/location_field/result_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  List<Result> result;
  LocationModel(this.result);
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
