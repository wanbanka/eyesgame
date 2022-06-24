// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Properties _$$_PropertiesFromJson(Map<String, dynamic> json) =>
    _$_Properties(
      sprites: (json['sprites'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, CharFrame.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      platforms: (json['platforms'] as List<dynamic>?)
              ?.map((e) => CharFrame.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? "",
      backgroundImage: json['background_image'] as String? ?? "",
      floorImage: json['floor_image'] as String? ?? "",
      speed: json['speed'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      'sprites': instance.sprites.map((k, e) => MapEntry(k, e.toJson())),
      'platforms': instance.platforms.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'background_image': instance.backgroundImage,
      'floor_image': instance.floorImage,
      'speed': instance.speed,
    };
