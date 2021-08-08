// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultLocation _$ResultLocationFromJson(Map<String, dynamic> json) {
  return ResultLocation(
    (json['lat'] as num).toDouble(),
    (json['lng'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ResultLocationToJson(ResultLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
