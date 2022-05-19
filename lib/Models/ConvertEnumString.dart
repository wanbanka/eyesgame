import 'package:enum_to_string/enum_to_string.dart';

/**
 * Object looking for the appropriate state 
 * according to the search string
 */

class ConvertEnumString {
  /**
   * Look for the appropriate enum
   */

  static Enum getEnumFromString(List<dynamic> values, String search) {
    return EnumToString.fromString(values, search);
  }
}
