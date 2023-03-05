import 'package:cloud_firestore/cloud_firestore.dart';

class ZakatProfesiModel {
  ZakatProfesiModel({
    required this.nama,
    required this.metode,
    required this.created_at,
    required this.uid,
    required this.gaji_per_bulan,
    required this.gaji_per_tahun,
    required this.zakat_per_bulan,
    required this.zakat_per_tahun,
  });

  final String nama;
  final String metode;
  final Timestamp created_at;
  final String uid;
  final dynamic gaji_per_bulan;
  final dynamic gaji_per_tahun;
  final dynamic zakat_per_bulan; //pakai int agar bisa dijumlah
  final dynamic zakat_per_tahun;

  factory ZakatProfesiModel.fromJson(Map<String, dynamic> json) =>
      ZakatProfesiModel(
        nama: json["nama"] ?? "",
        metode: json["metode"] ?? "",
        created_at: json["created_at"],
        uid: json["user"]["uid"] ?? "",
        gaji_per_bulan: json["gaji_per_bulan"] ?? 0,
        gaji_per_tahun: json["gaji_per_tahun"] ?? 0,
        zakat_per_bulan: json["zakat_per_bulan"] ?? 0,
        zakat_per_tahun: json["zakat_per_tahun"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "gaji_per_bulan": gaji_per_bulan,
        "gaji_per_tahun": gaji_per_tahun,
        "zakat_per_bulan": zakat_per_bulan,
        "zakat_per_tahun": zakat_per_tahun,
        "metode": metode,
        "created_at": created_at,
        "uid": uid,
      };
}
