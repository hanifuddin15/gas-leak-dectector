import 'package:gas_leak_detector/models/get_user_devices_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';

// Import your model file

class UserDevicesController extends GetxController {
  var userDevices = UserDevicesModel().obs;
  LocalData localData = Get.find();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      Uri url = Uri.parse("${Urls.baseUrl}${Urls.getUserDevices}?token=${localData.access_token}");
      final response = await http.get(
        //Uri.parse("{{GasLeakURL}}/api/user-devices?token={{GasToken}}"),
        url,
      );

      if (response.statusCode == 200) {
        userDevices(UserDevicesModel.fromJson(jsonDecode(response.body)));
        print(response.body);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
