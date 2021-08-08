import 'package:json_annotation/json_annotation.dart';

part 'distance.g.dart';

@JsonSerializable()
class Distance {
  String text;
  Distance(this.text);
  factory Distance.fromJson(Map<String, dynamic> json) =>
      _$DistanceFromJson(json);
  Map<String, dynamic> toJson() => _$DistanceToJson(this);
}
