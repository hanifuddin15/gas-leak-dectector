import 'profile_update_model.dart';

class ProfileModel {
  bool? error;
  String? msg;
  MyProfile? myprofile;

  ProfileModel({this.error, this.msg, this.myprofile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    myprofile = json['data'] != null ? new MyProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.myprofile != null) {
      data['data'] = this.myprofile!.toJson();
    }
    return data;
  }
}

class MyProfile {
  int? id;
  String? name;
  String? username;
  String? email;
  String? mobile;
  String? usertype;
  String? emailVerifiedAt;
  String? profilePhoto;
  String? address;
  String? twoFactorCode;
  String? lastLoginDate;
  String? registerWith;
  String? createdAt;
  String? updatedAt;

  MyProfile(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.mobile,
      this.usertype,
      this.emailVerifiedAt,
      this.profilePhoto,
      this.address,
      this.twoFactorCode,
      this.lastLoginDate,
      this.registerWith,
      this.createdAt,
      this.updatedAt});

  MyProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    usertype = json['usertype'];
    emailVerifiedAt = json['email_verified_at'];
    profilePhoto = json['profile_photo'];
    address = json['address'];
    twoFactorCode = json['two_factor_code'];
    lastLoginDate = json['last_login_date'];
    registerWith = json['register_with'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['usertype'] = this.usertype;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_photo'] = this.profilePhoto;
    data['address'] = this.address;
    data['two_factor_code'] = this.twoFactorCode;
    data['last_login_date'] = this.lastLoginDate;
    data['register_with'] = this.registerWith;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
