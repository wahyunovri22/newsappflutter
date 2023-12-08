
class ResponsePost {
  int? kode;
  String? pesan;

  ResponsePost({this.kode, this.pesan});

  ResponsePost.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    pesan = json['pesan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode'] = kode;
    data['pesan'] = pesan;
    return data;
  }
}