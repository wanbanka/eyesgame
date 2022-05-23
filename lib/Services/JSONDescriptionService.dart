import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

/**
 * Service retrieving data from assets (maybe from a 
 * NoSQL database)
 */

class JSONDescriptionService {
/**
 * Load parameters from asset
 */

  Future<Map<String, dynamic>> loadParameters(String searchType) async {
    Map<String, dynamic> parameters = json.decode(
        await rootBundle.loadString("assets/parameters/$searchType.json"));

    return parameters[searchType];
  }
}
