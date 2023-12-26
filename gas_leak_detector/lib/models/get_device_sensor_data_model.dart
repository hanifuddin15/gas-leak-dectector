// class DeviceSensorData {
//   bool? error;
//   String? msg;
//   SensorDevice? sesnsorDevice;

//   DeviceSensorData({this.error, this.msg, this.sesnsorDevice});

//   DeviceSensorData.fromJson(Map<String, dynamic> json) {
//     error = json['error'];
//     msg = json['msg'];
//     sesnsorDevice = json['data'] != null ? new SensorDevice.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this.error;
//     data['msg'] = this.msg;
//     if (this.sesnsorDevice != null) {
//       data['data'] = this.sesnsorDevice!.toJson();
//     }
//     return data;
//   }
// }

// class SensorDevice {
//   SensorData? sensorData;
//   DeviceStatusData? deviceStatusData;

//   SensorDevice({this.sensorData, this.deviceStatusData});

//   SensorDevice.fromJson(Map<String, dynamic> json) {
//     sensorData = json['SensorData'] != null
//         ? new SensorData.fromJson(json['SensorData'])
//         : null;
//     deviceStatusData = json['DeviceStatusData'] != null
//         ? new DeviceStatusData.fromJson(json['DeviceStatusData'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.sensorData != null) {
//       data['SensorData'] = this.sensorData!.toJson();
//     }
//     if (this.deviceStatusData != null) {
//       data['DeviceStatusData'] = this.deviceStatusData!.toJson();
//     }
//     return data;
//   }
// }

// class SensorData {
//   int? id;
//   String? deviceId;
//   String? childDeviceId;
//   String? batteryLevel;
//   String? temperature;
//   String? humidity;
//   String? gasConcentrationLevel;
//   String? userId;
//   String? dataDateTime;
//   String? createdAt;
//   String? updatedAt;

//   SensorData(
//       {this.id,
//       this.deviceId,
//       this.childDeviceId,
//       this.batteryLevel,
//       this.temperature,
//       this.humidity,
//       this.gasConcentrationLevel,
//       this.userId,
//       this.dataDateTime,
//       this.createdAt,
//       this.updatedAt});

//   SensorData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     deviceId = json['device_id'];
//     childDeviceId = json['child_device_id'];
//     batteryLevel = json['battery_level'];
//     temperature = json['temperature'];
//     humidity = json['humidity'];
//     gasConcentrationLevel = json['gas_concentration_level'];
//     userId = json['user_id'];
//     dataDateTime = json['data_date_time'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['device_id'] = this.deviceId;
//     data['child_device_id'] = this.childDeviceId;
//     data['battery_level'] = this.batteryLevel;
//     data['temperature'] = this.temperature;
//     data['humidity'] = this.humidity;
//     data['gas_concentration_level'] = this.gasConcentrationLevel;
//     data['user_id'] = this.userId;
//     data['data_date_time'] = this.dataDateTime;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class DeviceStatusData {
//   int? id;
//   String? deviceId;
//   String? childDeviceId;
//   String? gasLeakStatus;
//   String? gasValveStatus;
//   String? powerStatus;
//   String? gsmStatus;
//   String? wifiStatus;
//   String? internetStatus;
//   String? userId;
//   String? dataDateTime;
//   String? createdAt;
//   String? updatedAt;

//   DeviceStatusData(
//       {this.id,
//       this.deviceId,
//       this.childDeviceId,
//       this.gasLeakStatus,
//       this.gasValveStatus,
//       this.powerStatus,
//       this.gsmStatus,
//       this.wifiStatus,
//       this.internetStatus,
//       this.userId,
//       this.dataDateTime,
//       this.createdAt,
//       this.updatedAt});

//   DeviceStatusData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     deviceId = json['device_id'];
//     childDeviceId = json['child_device_id'];
//     gasLeakStatus = json['gas_leak_status'];
//     gasValveStatus = json['gas_valve_status'];
//     powerStatus = json['power_status'];
//     gsmStatus = json['gsm_status'];
//     wifiStatus = json['wifi_status'];
//     internetStatus = json['internet_status'];
//     userId = json['user_id'];
//     dataDateTime = json['data_date_time'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['device_id'] = this.deviceId;
//     data['child_device_id'] = this.childDeviceId;
//     data['gas_leak_status'] = this.gasLeakStatus;
//     data['gas_valve_status'] = this.gasValveStatus;
//     data['power_status'] = this.powerStatus;
//     data['gsm_status'] = this.gsmStatus;
//     data['wifi_status'] = this.wifiStatus;
//     data['internet_status'] = this.internetStatus;
//     data['user_id'] = this.userId;
//     data['data_date_time'] = this.dataDateTime;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class DeviceSensorData {
  bool? error;
  String? msg;
  SensorDevice? sesnsorDevice;

  DeviceSensorData({this.error, this.msg, this.sesnsorDevice});

  DeviceSensorData.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    sesnsorDevice = json['data'] != null ? new SensorDevice.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.sesnsorDevice != null) {
      data['data'] = this.sesnsorDevice!.toJson();
    }
    return data;
  }
}

class SensorDevice {
  DeviceStatusData? deviceStatusData;
  List<SensorData>? sensorData;

  SensorDevice({this.deviceStatusData, this.sensorData});

  SensorDevice.fromJson(Map<String, dynamic> json) {
    deviceStatusData = json['DeviceStatusData'] != null
        ? new DeviceStatusData.fromJson(json['DeviceStatusData'])
        : null;
    if (json['SensorData'] != null) {
      sensorData = <SensorData>[];
      json['SensorData'].forEach((v) {
        sensorData!.add(new SensorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deviceStatusData != null) {
      data['DeviceStatusData'] = this.deviceStatusData!.toJson();
    }
    if (this.sensorData != null) {
      data['SensorData'] = this.sensorData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeviceStatusData {
  int? id;
  String? deviceId;
  String? childDeviceId;
  String? gasLeakStatus;
  String? gasValveStatus;
  String? powerStatus;
  String? gsmStatus;
  String? wifiStatus;
  String? internetStatus;
  String? userId;
  String? dataDateTime;
  String? createdAt;
  String? updatedAt;

  DeviceStatusData(
      {this.id,
      this.deviceId,
      this.childDeviceId,
      this.gasLeakStatus,
      this.gasValveStatus,
      this.powerStatus,
      this.gsmStatus,
      this.wifiStatus,
      this.internetStatus,
      this.userId,
      this.dataDateTime,
      this.createdAt,
      this.updatedAt});

  DeviceStatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    childDeviceId = json['child_device_id'];
    gasLeakStatus = json['gas_leak_status'];
    gasValveStatus = json['gas_valve_status'];
    powerStatus = json['power_status'];
    gsmStatus = json['gsm_status'];
    wifiStatus = json['wifi_status'];
    internetStatus = json['internet_status'];
    userId = json['user_id'];
    dataDateTime = json['data_date_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_id'] = this.deviceId;
    data['child_device_id'] = this.childDeviceId;
    data['gas_leak_status'] = this.gasLeakStatus;
    data['gas_valve_status'] = this.gasValveStatus;
    data['power_status'] = this.powerStatus;
    data['gsm_status'] = this.gsmStatus;
    data['wifi_status'] = this.wifiStatus;
    data['internet_status'] = this.internetStatus;
    data['user_id'] = this.userId;
    data['data_date_time'] = this.dataDateTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SensorData {
  int? id;
  String? deviceId;
  String? childDeviceId;
  String? batteryLevel;
  String? temperature;
  String? humidity;
  String? gasConcentrationLevel;
  String? userId;
  String? deviceStatusId;
  String? dataDateTime;
  String? createdAt;
  String? updatedAt;

  SensorData(
      {this.id,
      this.deviceId,
      this.childDeviceId,
      this.batteryLevel,
      this.temperature,
      this.humidity,
      this.gasConcentrationLevel,
      this.userId,
      this.deviceStatusId,
      this.dataDateTime,
      this.createdAt,
      this.updatedAt});

  SensorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    childDeviceId = json['child_device_id'];
    batteryLevel = json['battery_level'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    gasConcentrationLevel = json['gas_concentration_level'];
    userId = json['user_id'];
    deviceStatusId = json['device_status_id'];
    dataDateTime = json['data_date_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_id'] = this.deviceId;
    data['child_device_id'] = this.childDeviceId;
    data['battery_level'] = this.batteryLevel;
    data['temperature'] = this.temperature;
    data['humidity'] = this.humidity;
    data['gas_concentration_level'] = this.gasConcentrationLevel;
    data['user_id'] = this.userId;
    data['device_status_id'] = this.deviceStatusId;
    data['data_date_time'] = this.dataDateTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
