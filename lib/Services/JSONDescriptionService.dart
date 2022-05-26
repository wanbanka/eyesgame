import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

/**
 * Service retrieving data from assets (maybe from a 
 * NoSQL database)
 */

class JSONDescriptionService {
/**
 * Load hero's features from asset
 */

  Future<Map<String, dynamic>> loadHero() async {
    Map<String, dynamic> parameters =
        json.decode(await rootBundle.loadString("assets/parameters/hero.json"));

    return parameters["hero"];
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
