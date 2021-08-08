import 'package:field_for_rent/pages/views/distance/calcu_distance/routes.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  List<Routes> routes;
  Result(this.routes);
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
