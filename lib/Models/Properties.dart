import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

import 'CharFrame.dart';

part 'Properties.freezed.dart';
part 'Properties.g.dart';

/**
 * Gathering of different properties describing sprites,
 * backgrounds, platforms, objects...
 */

@freezed
class Properties with _$Properties {
  Properties._();

  @JsonSerializable(explicitToJson: true)
  factory Properties({
    @Default({}) Map<String, CharFrame> sprites,
    @Default(null) CharFrame? platform,
    @Default(null) CharFrame? control,
    @Default("") String name,
    @Default("") @JsonKey(name: "background_image") String backgroundImage,
    @Default("") @JsonKey(name: "floor_image") String floorImage,
    @Default(0) int speed,
    @Default(0.0) @JsonKey(name: "x") double posX,
    @Default(0.0) @JsonKey(name: "y") double posY,
  }) = _Properties;

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}
