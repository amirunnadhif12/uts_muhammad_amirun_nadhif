class ObatModel {
  final String id;
  final String nama;
  final String kategori;
  final String gambar;
  final int harga;

  ObatModel({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.gambar,
    required this.harga,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'kategori': kategori,
        'gambar': gambar,
        'harga': harga,
      };

  factory ObatModel.fromJson(Map<String, dynamic> j) => ObatModel(
        id: j['id'],
        nama: j['nama'],
        kategori: j['kategori'],
        gambar: j['gambar'],
        harga: j['harga'],
      );
}
