class User {
  User({
    required this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.token,
  });
  int id;
  String nama;
  String email;
  String nomorHp;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      nomorHp: json['nomor_hp'],
      token: '',
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['nomor_hp'] = nomorHp;
    return data;
  }
}
