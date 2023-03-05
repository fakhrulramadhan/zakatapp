import 'package:cloud_firestore/cloud_firestore.dart';

class ZakatPerniagaanModel {
  ZakatPerniagaanModel({
    required this.nama,
    required this.metode,
    required this.created_at,
    required this.uid,
    required this.aset_lancar,
    required this.hutang_jangka_pendek,
    required this.tot_zakat_perniagaan,
  });

  final String nama;
  final int aset_lancar;
  final int hutang_jangka_pendek;
  final num tot_zakat_perniagaan; //pakai int agar bisa dijumlah
  final String metode;
  final Timestamp created_at;
  final String uid;

  factory ZakatPerniagaanModel.fromJson(Map<String, dynamic> json) =>
      ZakatPerniagaanModel(
        nama: json["nama"] ?? "",
        metode: json["metode"] ?? "",
        created_at: json["created_at"],
        uid: json["user"]["uid"] ?? "",
        aset_lancar: json["aset_lancar"] ?? 0,
        hutang_jangka_pendek: json["hutang_jangka_pendek"] ?? 0,
        tot_zakat_perniagaan: json["tot_zakat_perniagaan"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "aset_lancar": aset_lancar,
        "hutang_jangka_pendek": hutang_jangka_pendek,
        "tot_zakat_perniagaan": tot_zakat_perniagaan,
        "metode": metode,
        "created_at": created_at,
        "uid": uid,
      };
}
