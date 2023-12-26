// class WifiSetup {
// 	bool? error;
// 	String? msg;
// 	Data? data;

// 	WifiSetup({this.error, this.msg, this.data});

// 	WifiSetup.fromJson(Map<String, dynamic> json) {
// 		error = json['error'];
// 		msg = json['msg'];
// 		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['error'] = this.error;
// 		data['msg'] = this.msg;
// 		if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
// 		return data;
// 	}
// }

// class Data {


// 	Data({});

// 	Data.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

class WifiSettingsResponse {
  bool? error;
  String? msg;
  Map<String, dynamic>? data;

  WifiSettingsResponse({this.error, this.msg, this.data});

  WifiSettingsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    data = json['data'] as Map<String, dynamic>? ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['error'] = error;
    jsonData['msg'] = msg;
    jsonData['data'] = data;
    return jsonData;
  }
}

