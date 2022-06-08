import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../Models/Enums/ResponseType.dart';
import '../../Models/Enums/DataType.dart';
import '../../Models/Properties.dart';
import '../../Models/Enums/Coords.dart';

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
      {@Default(ResponseType.none)
          ResponseType type,
      @Default({})
          Map<DataType, Properties> gameElements,
      @Assert("computedCoords.length == 2")
      @Default({})
          Map<Coords, double> computedCoords,
      String? errorMessage}) = _LoadedResponse;

  factory LoadedResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadedResponseFromJson(json);
}
