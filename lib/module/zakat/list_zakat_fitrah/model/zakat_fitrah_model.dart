class ZakatFitrahModel {
  ZakatFitrahModel({
    required this.metode,
    required this.nama,
    required this.uid,
    required this.nominal,
  });

  final String metode;
  final String nama;
  final String uid;
  final int nominal;

  factory ZakatFitrahModel.fromJson(Map<String, dynamic> json) =>
      ZakatFitrahModel(
        metode: json["metode"] ?? "",
        nama: json["nama"] ?? "",
        uid: json["user"]["uid"] ?? "",
        nominal: json["nominal"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "metode": metode,
        "nama": nama,
        "productId": uid,
        "nominal": nominal,
      };
}
