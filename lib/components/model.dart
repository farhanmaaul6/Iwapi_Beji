class Pengurus {
  String id;
  final String nama;
  final String alamat;
  final String? noHp;
  final String jenisUsaha;
  final String perizinan;

  Pengurus({
    this.id = '',
    required this.nama,
    required this.alamat,
    this.noHp,
    required this.jenisUsaha,
    required this.perizinan,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'alamat': alamat,
        'noHp': noHp,
        'jenisUsaha': jenisUsaha,
        'perizinan': perizinan,
      };

  static Pengurus fromJson(Map<String, dynamic> json) => Pengurus(
        id: json['id'] ?? '',
        nama: json['nama'] ?? '',
        alamat: json['alamat'] ?? '',
        noHp: json['noHp'] != null ? json['noHp'].toString() : null,
        jenisUsaha: json['jenisUsaha'] ?? '',
        perizinan: json['perizinan'] ?? '',
      );
}
