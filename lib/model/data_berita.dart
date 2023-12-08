
class DataBerita {

  String? image,judul,tema,owner;

  DataBerita(this.image,this.judul, this.tema, this.owner);
}

class InsertBerita {
  List<DataBerita> createBerita(){
    List<DataBerita> list = [];
    list.add(DataBerita("https://cdn0-production-images-kly.akamaized.net/Pjmte8_KA0FJwDhBGc5AnEMxT_8=/800x450/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4592437/original/004449000_1695971006-images.jpeg","Pengacara Sebut Jessica Akan Ajukan PK Lagi atas Kasus Kopi Sianida", "Media", "Kabar kabari"));
    list.add(DataBerita("https://asset-2.tstatic.net/sumsel/foto/bank/images/Reaksi-Jessica-Wongso-saat-tahu-film-dokumenter-ice-cold-tentang-kasus-sianida-viral.jpg","Kasus Kopi Sianida Mirna & Manipulasi Klaim Asuransi di RI", "Politik", "Silet"));
    list.add(DataBerita("https://asset-a.grid.id/crop/0x0:0x0/945x630/photo/2023/10/08/dr-djaja-surya-atmadja-angkat-bi-20231008010002.jpg","Hotman Paris Ungkap Kejanggalan Kasus Kopi Sianida", "Media", "Silet"));
    return list;
  }
}