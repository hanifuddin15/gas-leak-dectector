class UserDevicesModel {
  bool? error;
  String? msg;
  DeviceInfo? deviceInfo;

  UserDevicesModel({this.error, this.msg, this.deviceInfo});

  UserDevicesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    deviceInfo = json['data'] != null ? new DeviceInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.deviceInfo != null) {
      data['data'] = this.deviceInfo!.toJson();
    }
    return data;
  }
}

class DeviceInfo {
  UserInfo? userInfo;
  List<MasterDevices>? masterDevices;
  List<ChildDevices>? childDevices;

  DeviceInfo({this.userInfo, this.masterDevices, this.childDevices});

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    if (json['master_devices'] != null) {
      masterDevices = <MasterDevices>[];
      json['master_devices'].forEach((v) {
        masterDevices!.add(new MasterDevices.fromJson(v));
      });
    }
    if (json['child_devices'] != null) {
      childDevices = <ChildDevices>[];
      json['child_devices'].forEach((v) {
        childDevices!.add(new ChildDevices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    if (this.masterDevices != null) {
      data['master_devices'] =
          this.masterDevices!.map((v) => v.toJson()).toList();
    }
    if (this.childDevices != null) {
      data['child_devices'] =
          this.childDevices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInfo {
  int? userId;
  String? name;
  String? usertype;
  String? email;
  String? mobile;
  String? address;

  UserInfo(
      {this.userId,
      this.name,
      this.usertype,
      this.email,
      this.mobile,
      this.address});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    usertype = json['usertype'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['usertype'] = this.usertype;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    return data;
  }
}

class MasterDevices {
  int? masterDeviceId;
  String? deviceName;
  String? deviceType;
  String? deviceLocation;
  String? syncMobileId;
  String? ssid;
  String? ssidPass;
  int? userId;
  String? createdAt;
  String? updatedAt;

  MasterDevices(
      {this.masterDeviceId,
      this.deviceName,
      this.deviceType,
      this.deviceLocation,
      this.syncMobileId,
      this.ssid,
      this.ssidPass,
      this.userId,
      this.createdAt,
      this.updatedAt});

  MasterDevices.fromJson(Map<String, dynamic> json) {
    masterDeviceId = json['master_device_id'];
    deviceName = json['device_name'];
    deviceType = json['device_type'];
    deviceLocation = json['device_location'];
    syncMobileId = json['sync_mobile_id'];
    ssid = json['ssid'];
    ssidPass = json['ssid_pass'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['master_device_id'] = this.masterDeviceId;
    data['device_name'] = this.deviceName;
    data['device_type'] = this.deviceType;
    data['device_location'] = this.deviceLocation;
    data['sync_mobile_id'] = this.syncMobileId;
    data['ssid'] = this.ssid;
    data['ssid_pass'] = this.ssidPass;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class ChildDevices {
  int? masterDeviceId;
  String? deviceName;
  String? deviceType;
  String? deviceLocation;
  String? syncMobileId;
  String? ssid;
  String? ssidPass;
  int? userId;
  String? createdAt;
  String? updatedAt;

  ChildDevices(
      {this.masterDeviceId,
      this.deviceName,
      this.deviceType,
      this.deviceLocation,
      this.syncMobileId,
      this.ssid,
      this.ssidPass,
      this.userId,
      this.createdAt,
      this.updatedAt});

  ChildDevices.fromJson(Map<String, dynamic> json) {
    masterDeviceId = json['master_device_id'];
    deviceName = json['device_name'];
    deviceType = json['device_type'];
    deviceLocation = json['device_location'];
    syncMobileId = json['sync_mobile_id'];
    ssid = json['ssid'];
    ssidPass = json['ssid_pass'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['master_device_id'] = this.masterDeviceId;
    data['device_name'] = this.deviceName;
    data['device_type'] = this.deviceType;
    data['device_location'] = this.deviceLocation;
    data['sync_mobile_id'] = this.syncMobileId;
    data['ssid'] = this.ssid;
    data['ssid_pass'] = this.ssidPass;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}