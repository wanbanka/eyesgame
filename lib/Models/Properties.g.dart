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
      platform: json['platform'] == null
          ? null
          : CharFrame.fromJson(json['platform'] as Map<String, dynamic>),
      control: json['control'] == null
          ? null
          : CharFrame.fromJson(json['control'] as Map<String, dynamic>),
      name: json['name'] as String? ?? "",
      backgroundImage: json['background_image'] as String? ?? "",
      floorImage: json['floor_image'] as String? ?? "",
      speed: json['speed'] as int? ?? 0,
      posX: (json['x'] as num?)?.toDouble() ?? 0.0,
      posY: (json['y'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      'sprites': instance.sprites.map((k, e) => MapEntry(k, e.toJson())),
      'platform': instance.platform?.toJson(),
      'control': instance.control?.toJson(),
      'name': instance.name,
      'background_image': instance.backgroundImage,
      'floor_image': instance.floorImage,
      'speed': instance.speed,
      'x': instance.posX,
      'y': instance.posY,
    };
