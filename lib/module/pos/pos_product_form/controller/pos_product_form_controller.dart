// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:example/core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PosProductFormController extends State<PosProductFormView>
//     implements MvcController {
//   static late PosProductFormController instance;
//   late PosProductFormView view;

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//   }

//   @override
//   void dispose() => super.dispose();

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   doSave() async {
//     var photo = Input.get("photo");
//     var product_name = Input.get("product_name");
//     var price = Input.get("price");
//     var description = Input.get("description");
//     var category = Input.get("category");

//     //tambah data ke firebase
//     //fireadd tab
//     await FirebaseFirestore.instance.collection("pos_products").add({
//       "photo": photo,
//       "product_name": product_name,
//       "price": price,
//       "description": description,
//       "category": category,
//       //utk simpan data user yang pesan
//       "user": {
//         //ngambil data user, fireuser tab
//         "uid": FirebaseAuth.instance.currentUser!.uid,
//         "name": FirebaseAuth.instance.currentUser!.displayName ?? " - ",
//         "email": FirebaseAuth.instance.currentUser!.email ?? " - ",
//       }
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const PosProductListView()),
//     );
//     //kalau mau pakai snackbar biasa
//     //ScaffoldMessenger.of(context).showSnackBar(snackBar);

//     snackbarIconSuccess(message: "Berhasil Tambah Data");
//   }
// }
