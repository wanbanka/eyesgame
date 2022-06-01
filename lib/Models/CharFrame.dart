import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'CharFrame.freezed.dart';

part 'CharFrame.g.dart';

/**
 * Information about a spritesheet (timing, animations...)
 */

@freezed
class CharFrame with _$CharFrame {
  CharFrame._();

  @JsonSerializable(explicitToJson: true)
  factory CharFrame(
      {@JsonKey(name: "src_image") required String srcImage,
      @JsonKey(name: "nb_sprites") required int nbSprites,
      @Default(0.1) @JsonKey(name: "step_time") double stepTime,
      @Default(0.0) @JsonKey(name: "x") double posX,
      @Default(0.0) @JsonKey(name: "y") double posY}) = _CharFrame;

  factory CharFrame.fromJson(Map<String, dynamic> json) =>
      _$CharFrameFromJson(json);
}
