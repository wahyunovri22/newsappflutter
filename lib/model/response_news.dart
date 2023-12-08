
class ResponseNews {
  bool? error;
  List<News>? news;

  ResponseNews({this.error, this.news});

  ResponseNews.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String? id;
  String? judul;
  String? deskripsi;
  String? cover;
  String? userinput;
  String? tanggal;

  News(
      {this.id,
        this.judul,
        this.deskripsi,
        this.cover,
        this.userinput,
        this.tanggal});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    cover = json['cover'];
    userinput = json['userinput'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['deskripsi'] = deskripsi;
    data['cover'] = cover;
    data['userinput'] = userinput;
    data['tanggal'] = tanggal;
    return data;
  }
}