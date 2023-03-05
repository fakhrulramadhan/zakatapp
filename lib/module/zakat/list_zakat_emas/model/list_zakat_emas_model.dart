import 'package:cloud_firestore/cloud_firestore.dart';

class ZakatEmasModel {
  ZakatEmasModel({
    required this.nama,
    required this.metode,
    required this.created_at,
    required this.uid,
    required this.jmlemas,
    required this.jmlperak,
    required this.zakatemas,
    required this.zakatperak,
  });

  final String nama;
  final int jmlemas; //pakai int agar nampilin angka saja
  final int jmlperak;
  final dynamic zakatemas; //pakai dynmaic agar bisa dijumlah
  final dynamic zakatperak;
  final String metode;
  final Timestamp created_at;
  final String uid;

  factory ZakatEmasModel.fromJson(Map<String, dynamic> json) => ZakatEmasModel(
        nama: json["nama"] ?? "",
        metode: json["metode"] ?? "",
        created_at: json["created_at"],
        uid: json["user"]["uid"] ?? "",
        jmlemas: json["jmlemas"] ?? 0,
        jmlperak: json["jmlperak"] ?? 0,
        zakatemas: json["zakatemas"] ?? 0,
        zakatperak: json["zakatperak"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jmlemas": jmlemas,
        "jmlperak": jmlperak,
        "zakatemas": zakatemas,
        "zakatperak": zakatperak,
        "metode": metode,
        "created_at": created_at,
        "uid": uid,
      };
}
