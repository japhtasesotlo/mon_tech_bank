/// Converts a String or int to a boolean.
/// "TRUE", "True" and "true" will be converted to true as a boolean
///  1 or "1" will return true as a boolean
///
bool convertBoolean(dynamic boolean) {
  if (boolean is String) {
    if (boolean == "1") {
      return true;
    }
    return boolean.toLowerCase() == "true";
  }
  if (boolean is int) {
    return boolean == 1;
  }
  return boolean;
}
