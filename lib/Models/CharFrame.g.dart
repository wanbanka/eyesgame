// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CharFrame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharFrame _$$_CharFrameFromJson(Map<String, dynamic> json) => _$_CharFrame(
      srcImage: json['src_image'] as String,
      nbSprites: json['nb_sprites'] as int,
      stepTime: (json['step_time'] as num?)?.toDouble() ?? 0.1,
      type: json['type'] as String? ?? "",
      size: (json['size'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_CharFrameToJson(_$_CharFrame instance) =>
    <String, dynamic>{
      'src_image': instance.srcImage,
      'nb_sprites': instance.nbSprites,
      'step_time': instance.stepTime,
      'type': instance.type,
      'size': instance.size,
    };
