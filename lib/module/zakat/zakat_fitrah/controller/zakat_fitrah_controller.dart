import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ZakatFitrahController extends State<ZakatFitrahView>
    implements MvcController {
  static late ZakatFitrahController instance;
  late ZakatFitrahView view;

  TextEditingController namaC = TextEditingController();
  TextEditingController nominalC = TextEditingController();

  //Int nominal = 30000 as Int;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    namaC.dispose();
    nominalC.dispose();
    super.dispose();
  }

  // void validasinominal() {
  //   if (zakatC.value.text <= nominal) {}
  // }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  simpanzfitrah() async {
    //bikin tangkapan data hasil dari inputan
    var nama = namaC.text;
    var nominal = int.parse(nominalC.text); //ambil dari texteditingcontrolller
    var metode = Input.get("metode"); //ambil dari id metode

    //fireadd tab
    await FirebaseFirestore.instance.collection("zakat_fitrah").add({
      "nama": nama, "nominal": nominal, "metode": metode,
      "created_at": DateTime.now(),
      //utk simpan data user yang input data
      "user": {
        //ngambil data user, tekan fireuser tab
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "email": FirebaseAuth.instance.currentUser!.email
      }
    });

    //kalau sudah tersimpan,sementara diarahkan ke halaman dashboard dulu
    //nanti bikin dan diarahkan ke halaman sukses zakat

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ZakatDashboardView()),
    // );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ZakatNavbarDashboardView()),
    );

    //muncullin pesan
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        "Berhasil Tambah Data Zakat",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating, //pesannya muncul diatas
    ));
  }
}
