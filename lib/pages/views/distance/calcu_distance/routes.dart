import 'package:field_for_rent/pages/views/distance/calcu_distance/distance.dart';
import 'package:json_annotation/json_annotation.dart';
part 'routes.g.dart';

@JsonSerializable()
class Routes {
  Distance distance;
  Routes(this.distance);
  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);
  Map<String, dynamic> toJson() => _$RoutesToJson(this);
}
