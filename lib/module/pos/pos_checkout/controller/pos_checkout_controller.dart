// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:example/core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PosCheckoutController extends State<PosCheckoutView>
//     implements MvcController {
//   static late PosCheckoutController instance;
//   late PosCheckoutView view;

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//   }

//   @override
//   void dispose() => super.dispose();

//   void pos_orders() async {
//     await FirebaseFirestore.instance.collection("pos_orders").get();
//   }

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   //bikin fungsi docheckout utk simpan data ke firebase
//   void doCheckout() async {
//     //ambil payment_method dari form
//     var payment_method = Input.get("payment_method");

//     //tambah data ke firebase
//     await FirebaseFirestore.instance.collection("pos_orders").add({
//       //kacau di created at
//       "created_at": Timestamp.now(), //tanggal transaksi
//       "table_number": PosTableController
//           .instance.selectedTable, //diambil dari posttablecontroller
//       "payment_method": payment_method,
//       //item yang dipesan
//       "items": PosController.instance.products.length,
//       //ambil total  harga
//       "total_price": PosController.instance.total_price,
//       //penjual / kasir diambil dari data kita sendiri, uid dan nama
//       "seller": {
//         //fireuser tab
//         "uid": FirebaseAuth.instance.currentUser!.uid,
//         //kalau enggak ada ganti strip
//         "name": FirebaseAuth.instance.currentUser!.displayName ?? "-",
//         "email": FirebaseAuth.instance.currentUser!.email ?? "-",

//         //karena loginnya sebagai guest, maka data sellernya tidak muncul
//       },
//       "booked": true,
//     });

//     //replacement utk mengganti awalan stack halamannya
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const PosMainNavigationView()),
//     );

//     snackbarSuccess(message: "Berhasil Checkout", duration: 5);

//     //menampilkan pesan data berhasil ditambahkan
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   const SnackBar(
//     //     content: Text(
//     //       "Berhasil Checkout",
//     //       style: TextStyle(fontSize: 14.0, color: Colors.white),
//     //     ),
//     //     backgroundColor: Colors.green,
//     //     duration: Duration(seconds: 4),
//     //     //menentukan posisi snackbar (atas / bawah)
//     //     behavior: SnackBarBehavior.floating,
//     //   ),
//     // );
//   }
// }
