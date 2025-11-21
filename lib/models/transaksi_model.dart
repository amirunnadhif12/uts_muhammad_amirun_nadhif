class TransaksiModel {
  String id;
  String obatId;
  String obatNama;
  int hargaSatuan;
  int jumlah;
  int total;
  String namaPembeli;
  String metode;
  String? nomorResep;
  String? catatan;
  String tanggal;
  String status;

  TransaksiModel({
    required this.id,
    required this.obatId,
    required this.obatNama,
    required this.hargaSatuan,
    required this.jumlah,
    required this.total,
    required this.namaPembeli,
    required this.metode,
    this.nomorResep,
    this.catatan,
    required this.tanggal,
    this.status = 'selesai',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'obatId': obatId,
        'obatNama': obatNama,
        'hargaSatuan': hargaSatuan,
        'jumlah': jumlah,
        'total': total,
        'namaPembeli': namaPembeli,
        'metode': metode,
        'nomorResep': nomorResep,
        'catatan': catatan,
        'tanggal': tanggal,
        'status': status,
      };

  factory TransaksiModel.fromJson(Map<String, dynamic> j) => TransaksiModel(
        id: j['id'],
        obatId: j['obatId'],
        obatNama: j['obatNama'],
        hargaSatuan: j['hargaSatuan'],
        jumlah: j['jumlah'],
        total: j['total'],
        namaPembeli: j['namaPembeli'],
        metode: j['metode'],
        nomorResep: j['nomorResep'],
        catatan: j['catatan'],
        tanggal: j['tanggal'],
        status: j['status'] ?? 'selesai',
      );
}
