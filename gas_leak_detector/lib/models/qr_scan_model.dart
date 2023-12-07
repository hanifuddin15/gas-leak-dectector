class DeviceData {
  String? deviceName;
  String? deviceType;
  String? versionCode;
  String? deviceId;
  String? organization;

  DeviceData({
    required this.deviceName,
    required this.deviceType,
    required this.versionCode,
    required this.deviceId,
    required this.organization,
  });

  factory DeviceData.fromJson(Map<String, dynamic> json) {
    return DeviceData(
      deviceName: json['device_name'] ?? '',
      deviceType: json['device_type'] ?? '',
      versionCode: json['version_code'] ?? '',
      deviceId: json['device_id'] ?? '',
      organization: json['organization'] ?? '',
    );
  }
}
