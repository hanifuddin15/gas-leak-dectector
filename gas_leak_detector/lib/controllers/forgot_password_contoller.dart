import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ForgotPasswordController extends GetxController {
   final TextEditingController phonenumbercontroller = TextEditingController();
  Rx<PhoneNumber> number = Rx<PhoneNumber>(PhoneNumber(isoCode: 'BD'));

  void updatePhoneNumber(String phoneNumber) async {
    PhoneNumber phoneNumberInfo =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'BD');

    number.value = phoneNumberInfo;
  }
  @override
  void onClose() {
    phonenumbercontroller.dispose();
    super.onClose();
  }
}