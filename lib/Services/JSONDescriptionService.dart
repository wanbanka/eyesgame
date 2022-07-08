import '../Models/Enums/DataType.dart';
import '../Models/Enums/Filter.dart';

import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

/**
 * Service retrieving data from assets
 */

class JSONDescriptionService {
/**
 * Load some features from asset
 */

  Future<dynamic> loadAttribute(DataType type,
      {Filter filter = Filter.name, String filterSearch = ""}) async {
    String attribute = "";

    switch (type) {
      case DataType.hero:
        attribute = "hero";
        break;

      case DataType.controls:
        attribute = "controls";
        break;

      case DataType.enemy:
        attribute = "enemies";
        break;
    }

    Map<String, dynamic> parameters = json.decode(
        await rootBundle.loadString("assets/parameters/$attribute.json"));

    if (parameters[attribute] is List &&
        (filterSearch.isNotEmpty && filter.name.isNotEmpty)) {
      var foundItem = parameters[attribute].firstWhere((element) {
        if (element[filter.name] == null) {
          throw ArgumentError(
              "The type of filter is wrong or doesn't exist in the asset's structure.");
        }

        return element[filter.name] == filterSearch;
      });

      return foundItem;
    }

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
