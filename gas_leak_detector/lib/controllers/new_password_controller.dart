import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController{
   final TextEditingController newpasswordcontroller = TextEditingController();
    final TextEditingController confirmpasswordcontroller = TextEditingController();
     final TextEditingController otpcontroller = TextEditingController();
      String? validateNewPassword(String? value) {
    if (newpasswordcontroller.text != confirmpasswordcontroller.text) {
      return 'Passwords do not match';
    }
    return null;
  }

}