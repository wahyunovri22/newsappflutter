
class ResponseLogin {
  bool? error;
  String? message;
  User? user;

  ResponseLogin({this.error, this.message, this.user});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? nama;
  String? alamat;
  String? role;

  User({this.nama, this.alamat, this.role});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    alamat = json['alamat'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['role'] = this.role;
    return data;
  }
}