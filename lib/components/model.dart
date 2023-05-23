class Pengurus {
  String id;
  final String nama;
  final String alamat;
  //final int noHp;
  //final String jenisUsaha;

  Pengurus({
    this.id = '',
    required this.nama,
    required this.alamat,
    // required this.noHp,
    //required this.jenisUsaha,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'alamat': alamat,
        // 'No.Hp': noHp,
        //'Jenis Usaha': jenisUsaha,
      };

  static Pengurus fromJson(Map<String, dynamic> json) => Pengurus(
        nama: json['nama'],
        alamat: json['alamat'],
        //noHp: json['No.Hp'],
        //jenisUsaha: json['jenis Usaha']
      );
}
