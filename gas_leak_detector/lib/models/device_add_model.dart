class DeviceAdd {
  bool? error;
  String? msg;
  DeviceSpec? spec;

  DeviceAdd({this.error, this.msg, this.spec});

  DeviceAdd.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    spec = json['data'] != null ? new DeviceSpec.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.spec != null) {
      data['data'] = this.spec!.toJson();
    }
    return data;
  }
}

class DeviceSpec {
  String? deviceName;
  String? deviceType;
  String? masterDeviceId;
  String? deviceLocation;
  String? syncMobileId;
  String? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  DeviceSpec(
      {this.deviceName,
      this.deviceType,
      this.masterDeviceId,
      this.deviceLocation,
      this.syncMobileId,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  DeviceSpec.fromJson(Map<String, dynamic> json) {
    deviceName = json['device_name'];
    deviceType = json['device_type'];
    masterDeviceId = json['master_device_id'];
    deviceLocation = json['device_location'];
    syncMobileId = json['sync_mobile_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_name'] = this.deviceName;
    data['device_type'] = this.deviceType;
    data['master_device_id'] = this.masterDeviceId;
    data['device_location'] = this.deviceLocation;
    data['sync_mobile_id'] = this.syncMobileId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
