// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Properties _$$_PropertiesFromJson(Map<String, dynamic> json) =>
    _$_Properties(
      states: (json['states'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, CharFrame.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      'states': instance.states.map((k, e) => MapEntry(k, e.toJson())),
    };
