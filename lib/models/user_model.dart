class UserModel {
  String nama;
  String telepon;
  String alamat;
  String username;
  String password;

  UserModel({
    required this.nama,
    required this.telepon,
    required this.alamat,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "telepon": telepon,
        "alamat": alamat,
        "username": username,
        "password": password,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json['nama'],
        telepon: json['telepon'],
        alamat: json['alamat'],
        username: json['username'],
        password: json['password'],
      );
}
