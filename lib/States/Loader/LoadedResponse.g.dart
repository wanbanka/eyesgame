// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoadedResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoadedResponse _$$_LoadedResponseFromJson(Map<String, dynamic> json) =>
    _$_LoadedResponse(
      type: $enumDecodeNullable(_$ResponseTypeEnumMap, json['type']) ??
          ResponseType.none,
      gameElements: (json['gameElements'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry($enumDecode(_$DataTypeEnumMap, k),
                Properties.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      computedCoords: (json['computedCoords'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                $enumDecode(_$CoordsEnumMap, k), (e as num).toDouble()),
          ) ??
          const {},
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$_LoadedResponseToJson(_$_LoadedResponse instance) =>
    <String, dynamic>{
      'type': _$ResponseTypeEnumMap[instance.type],
      'gameElements': instance.gameElements
          .map((k, e) => MapEntry(_$DataTypeEnumMap[k], e.toJson())),
      'computedCoords': instance.computedCoords
          .map((k, e) => MapEntry(_$CoordsEnumMap[k], e)),
      'errorMessage': instance.errorMessage,
    };

const _$ResponseTypeEnumMap = {
  ResponseType.none: 'none',
  ResponseType.success: 'success',
  ResponseType.error: 'error',
};

const _$DataTypeEnumMap = {
  DataType.hero: 'hero',
  DataType.level: 'level',
  DataType.enemy: 'enemy',
  DataType.boss: 'boss',
  DataType.platform: 'platform',
  DataType.controls: 'controls',
};

const _$CoordsEnumMap = {
  Coords.x: 'x',
  Coords.y: 'y',
};
