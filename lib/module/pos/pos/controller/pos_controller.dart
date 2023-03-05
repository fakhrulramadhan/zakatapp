// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:example/state_util.dart';
// import '../view/pos_view.dart';

// class PosController extends State<PosView> implements MvcController {
//   static late PosController instance;
//   late PosView view;

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//     loadProducts();
//   }

//   @override
//   void dispose() => super.dispose();

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   String cari = "";

//   //var products utk inisiasi list kosong prodcuts dan menampung data produk
//   //ada index ke berapa
//   List products = [];

//   //fungsi untuk memuat data pos_products
//   loadProducts() async {
//     //get data dari firebase
//     //fireget tab
//     //var snapshot utk mendapatkan data dari firebase,
//     //get data dari tabel pos_products

//     var snapshot =
//         await FirebaseFirestore.instance.collection("pos_products").get();

//     for (var i = 0; i < snapshot.docs.length; i++) {
//       //ambil per data produk, bukan var tapi map string dynamic, key value
//       //Map<String, dynamic> item = (snapshot.docs[i].data() as Map<String, dynamic>);

//       //map utk menapilkan data pos_products
//       Map<String, dynamic> item = snapshot.docs[i].data();

//       //didalam itemnya sudah mengandung id dan data per produk
//       //kasih inisiasi awal id (ranndom), bisa utk tambah field apa aja
//       item["id"] = snapshot.docs[i].id;

//       //kasih inisiasi awal  qty 0, agar tidak dihandled di frontend
//       //backendnya pakai firebase
//       item["qty"] = 0;

//       //cara ambil data dari pos_products
//       products.add(item); //menambahkan dari list kosong menjadi data map produk

//     }

//     //jangan lupa diupdate / set state
//     update();
//   }

//   //fungsi getter untuk  membuat total harga tipe datanya double
//   // double get total_price {
//   //   //mendeklaraskian variabel awal total barang yang dibeli
//   //   var rowsTotal = 0.0;
//   //   for (var i = 0; i < products.length; i++) {
//   //     var item = products[i]; // menampug jumlah produk yang dibeli

//   //     //double rowTotal = item['qty'] * item['price']; //totharga tipenya double

//   //     //harus diparsing dari double ke string dulu
//   //     double rowTotal = double.parse(item['qty'].toString()) *
//   //         double.parse(item['price'].toString());

//   //     //menammbahkan prooduk yang dibeli sekaligus dikalkulasikan
//   //     rowsTotal += rowTotal;
//   //   }

//   //   return rowsTotal;
//   // }

//   int get total_price {
//     //mendeklaraskian variabel awal total barang yang dibeli
//     var rowsTotal = 0;
//     for (var i = 0; i < products.length; i++) {
//       var item = products[i]; // menampug jumlah produk yang dibeli

//       //double rowTotal = item['qty'] * item['price']; //totharga tipenya double

//       //harus diparsing dari double ke string dulu
//       int rowTotal = int.parse(item['qty'].toString()) *
//           int.parse(item['price'].toString());

//       //menammbahkan prooduk yang dibeli sekaligus dikalkulasikan
//       rowsTotal += rowTotal;
//     }

//     return rowsTotal;
//   }
// }
