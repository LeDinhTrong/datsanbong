import 'package:field_for_rent/pages/views/distance/calcu_distance/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distance_model.g.dart';

@JsonSerializable()
class DistanceModel {
  Result result;
  DistanceModel(this.result);
  factory DistanceModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$DistanceModelToJson(this);
}
