// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['address'] as String,
    ResultLocation.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'address': instance.address,
      'location': instance.location,
    };
