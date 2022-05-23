// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoadedResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoadedResponse _$$_LoadedResponseFromJson(Map<String, dynamic> json) =>
    _$_LoadedResponse(
      type: $enumDecodeNullable(_$ResponseTypeEnumMap, json['type']) ??
          ResponseType.none,
      attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry($enumDecode(_$DataTypeEnumMap, k),
                Properties.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$_LoadedResponseToJson(_$_LoadedResponse instance) =>
    <String, dynamic>{
      'type': _$ResponseTypeEnumMap[instance.type],
      'attributes': instance.attributes
          .map((k, e) => MapEntry(_$DataTypeEnumMap[k], e.toJson())),
      'errorMessage': instance.errorMessage,
    };

const _$ResponseTypeEnumMap = {
  ResponseType.none: 'none',
  ResponseType.success: 'success',
  ResponseType.error: 'error',
};

const _$DataTypeEnumMap = {
  DataType.hero: 'hero',
  DataType.background: 'background',
  DataType.enemy: 'enemy',
  DataType.boss: 'boss',
  DataType.platform: 'platform',
};
