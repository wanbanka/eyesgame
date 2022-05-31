import '../Models/Enums/DataType.dart';

import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

/**
 * Service retrieving data from assets
 */

class JSONDescriptionService {
/**
 * Load some features from asset
 */

  Future<Map<String, dynamic>> loadAttribute(DataType type) async {
    String attribute = "";

    switch (type) {
      case DataType.hero:
        attribute = "hero";
        break;

      case DataType.controls:
        attribute = "controls";
        break;
    }

    Map<String, dynamic> parameters = json.decode(
        await rootBundle.loadString("assets/parameters/$attribute.json"));

    return parameters[attribute];
  }

/**
 * Load level's features
 */

  Future<Map<String, dynamic>> loadLevel(String levelName) async {
    Map<String, dynamic> parameters = json
        .decode(await rootBundle.loadString("assets/parameters/levels.json"));

    dynamic level =
        parameters["levels"].firstWhere((level) => level["name"] == levelName);

    if (level == null) {
      throw FormatException("Level not found");
    }

    return level;
  }
}
