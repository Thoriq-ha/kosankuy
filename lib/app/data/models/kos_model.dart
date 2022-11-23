import 'dart:convert';

class Kos {
  Kos({
    required this.id,
    required this.namaKost,
    required this.deskripsi,
    required this.harga,
    required this.longlat,
    required this.gambar,
  });

  int id;
  String namaKost;
  String deskripsi;
  String harga;
  List<double> longlat;
  List<String> gambar;

  factory Kos.fromJson(Map<String, dynamic> json) {
    return Kos(
        id: json['id'],
        namaKost: json['nama_kost'],
        deskripsi: json['deskripsi'],
        harga: json['harga'],
        longlat: json['longlat']
            .toString()
            .split(';')
            .map((e) => double.parse(e))
            .toList(),
        gambar: (jsonDecode(json['gambar']) as List)
            .map((e) => e.toString())
            .toList());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_kost'] = namaKost;
    data['deskripsi'] = deskripsi;
    data['harga'] = harga;
    data['longlat'] = longlat;
    data['gambar'] = gambar;
    return data;
  }
}
