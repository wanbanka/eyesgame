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
  factory Properties(
      {@Default({}) Map<String, CharFrame> sprites,
      @Default([]) List<CharFrame> platforms,
      @Default("") String name,
      @Default("") @JsonKey(name: "background_image") String backgroundImage,
      @Default("") @JsonKey(name: "floor_image") String floorImage,
      @Default(0) int speed}) = _Properties;

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  /**
       * Add positionning of the object
       */

  Properties addCoords(double posX, double posY) {
    Map<String, CharFrame> newSprites = {};

    sprites.forEach((key, value) {
      newSprites.addAll({key: value.copyWith(posX: posX, posY: posY)});
    });

    return this.copyWith(sprites: newSprites);
  }
}
