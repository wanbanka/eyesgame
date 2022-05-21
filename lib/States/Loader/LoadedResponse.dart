import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'LoadedResponse.freezed.dart';
part 'LoadedResponse.g.dart';

/**
 * Infos about a request
 */

@freezed
class LoadedResponse with _$LoadedResponse {
  LoadedResponse._();

  @JsonSerializable(explicitToJson: true)
  factory LoadedResponse(
      {@Default("default") String name,
      @Default({}) Map<String, dynamic> attributes}) = _LoadedResponse;

  factory LoadedResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadedResponseFromJson(json);
}
