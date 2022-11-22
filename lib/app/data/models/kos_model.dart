class Kos {
  Kos({
    required this.id,
    required this.namaKost,
    required this.deskripsi,
    required this.harga,
    required this.longlat,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaKost;
  String deskripsi;
  String harga;
  String longlat;
  String gambar;
  String createdAt;
  String updatedAt;

  factory Kos.fromJson(Map<String, dynamic> json) {
    return Kos(
        id: json['id'],
        namaKost: json['nama_kost'],
        deskripsi: json['deskripsi'],
        harga: json['harga'],
        longlat: json['longlat'],
        gambar: json['gambar'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_kost'] = namaKost;
    data['deskripsi'] = deskripsi;
    data['harga'] = harga;
    data['longlat'] = longlat;
    data['gambar'] = gambar;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
