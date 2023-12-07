// class SignUpModel {
//   bool? error;
//   String? msg;
//   Data? data;

//   SignUpModel({this.error, this.msg, this.data});

//   SignUpModel.fromJson(Map<String, dynamic> json) {
//     error = json['error'];
//     msg = json['msg'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this.error;
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   User? user;
//   JwtToken? jwtToken;

//   Data({this.user, this.jwtToken});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     jwtToken = json['jwt_token'] != null
//         ? new JwtToken.fromJson(json['jwt_token'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.jwtToken != null) {
//       data['jwt_token'] = this.jwtToken!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   String? mobile;
//   String? usertype;
//   String? emailVerifiedAt;
//   String? profilePhoto;
//   String? address;
//   String? lastLoginDate;
//   int? masterDevice;
//   int? childDevice;
//   String? registerWith;
//   String? createdAt;
//   String? updatedAt;

//   User(
//       {this.id,
//       this.name,
//       this.username,
//       this.email,
//       this.mobile,
//       this.usertype,
//       this.emailVerifiedAt,
//       this.profilePhoto,
//       this.address,
//       this.lastLoginDate,
//       this.masterDevice,
//       this.childDevice,
//       this.registerWith,
//       this.createdAt,
//       this.updatedAt});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     mobile = json['mobile'];
//     usertype = json['usertype'];
//     emailVerifiedAt = json['email_verified_at'];
//     profilePhoto = json['profile_photo'];
//     address = json['address'];
//     lastLoginDate = json['last_login_date'];
//     masterDevice = json['master_device'];
//     childDevice = json['child_device'];
//     registerWith = json['register_with'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['mobile'] = this.mobile;
//     data['usertype'] = this.usertype;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['profile_photo'] = this.profilePhoto;
//     data['address'] = this.address;
//     data['last_login_date'] = this.lastLoginDate;
//     data['master_device'] = this.masterDevice;
//     data['child_device'] = this.childDevice;
//     data['register_with'] = this.registerWith;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class JwtToken {
//   String? accessToken;
//   String? tokenType;
//   int? expiresIn;

//   JwtToken({this.accessToken, this.tokenType, this.expiresIn});

//   JwtToken.fromJson(Map<String, dynamic> json) {
//     accessToken = json['access_token'];
//     tokenType = json['token_type'];
//     expiresIn = json['expires_in'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['access_token'] = this.accessToken;
//     data['token_type'] = this.tokenType;
//     data['expires_in'] = this.expiresIn;
//     return data;
//   }
// }
