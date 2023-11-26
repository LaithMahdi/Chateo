import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Email is not a valid";
    }
  }

  if (val.isEmpty) {
    return "$val can't be empty";
  }

  if (val.length < min) {
    return "must be less than $min";
  }

  if (val.length > max) {
    return "must be greater than $max";
  }
}
