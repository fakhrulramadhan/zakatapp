// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:example/state_util.dart';
// import '../view/pos_table_view.dart';
// import 'package:firebase_database/firebase_database.dart';

// class PosTableController extends State<PosTableView> implements MvcController {
//   static late PosTableController instance;
//   late PosTableView view;

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//   }

//   @override
//   void dispose() => super.dispose();

//   ambildata() async {
//     var snapshot = await FirebaseFirestore.instance
//         .collection("pos_orders")
//         .where("table_number", isNotEqualTo: 0)
//         .snapshots();

//     //var data = snapshot.da

    
//   }

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   // konekfirebase() async {
//   //   //FirebaseFirestore.instance.collection("pos_orders").snapshots();

//   //   var snapshot =
//   //       FirebaseFirestore.instance.collection("pos_orders").snapshots();

//   //   var table_number = snapshot.contains(needle)
//   // }

//   List pos_orders = [];

//   List Tableblocked = [9, 10, 11];

//   var datapos = FirebaseFirestore.instance
//       .collection("pos_orders")
//       .where("table_number", isNotEqualTo: 0)
//       .get();

//   muatdatapos() async {
//     final databaseReference = FirebaseDatabase.instance.ref();

//     databaseReference.push().set({'nama_node': 'nilai_node'});
//   }

//   loadPosOrder() async {
//     //get data dari firebase
//     //fireget tab
//     //var snapshot utk mendapatkan data dari firebase,
//     //get data dari tabel pos_products

//     var snapshot =
//         await FirebaseFirestore.instance.collection("pos_orders").get();

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
//       // item["table_number"] = snapshot.docs[i].data()["table_number"];

//       //cara ambil data dari pos_products
//       pos_orders
//           .add(item); //menambahkan dari list kosong menjadi data map produk

//     }

//     //jangan lupa diupdate / set state
//     update();
//   }

//   //var utk buat meja yang terpilih
//   int selectedTable = -1;
//   // bool selectedTable = false;

//   //utk membuat list nomor meja [index]
//   List tables = [
//     1,
//     2,
//     3,
//     4,
//     5,
//     6,
//     7,
//     8,
//     9,
//     10,
//     11,
//     12,
//     13,
//     14,
//     15,
//     16,
//     17,
//     18,
//     19,
//     20,
//     21,
//     22,
//     23,
//     24
//   ];
// }
