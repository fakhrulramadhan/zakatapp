import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/core.dart';
import 'package:example/string_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ZakatEmasController extends State<ZakatEmasView>
    implements MvcController {
  static late ZakatEmasController instance;
  late ZakatEmasView view;

  double nishabEmas = 0;
  double nishabPerak = 0;

  TextEditingController namaC = TextEditingController();
  TextEditingController jmlemasC = TextEditingController();
  TextEditingController jmlperakC = TextEditingController();
  TextEditingController zakatemasC = TextEditingController();
  TextEditingController zakatperakC = TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  hitungnishabEmas() async {
    //print("Nishab Emas");
    nishabEmas = StringExtensions(jmlemasC.text).parseDouble() * 0.025;

    //nishabEmas = StringExtensions(jmlemasC.text).parseDouble() * 0.025;

    return nishabEmas;
  }

  hitungnishabPerak() async {
    nishabPerak = StringExtensions(jmlperakC.text).parseDouble() * 0.025;

    // zakatperakC = (StringExtensions(jmlperakC.text).parseDouble() * 0.025)
    //     as TextEditingController;

    return nishabPerak; //menampilkan jumlah hasil nishab perak
  }

  resetnishabEmas() async {
    //print("Nishab Emas");
    nishabEmas = 0;

    //nishabEmas = StringExtensions(jmlemasC.text).parseDouble() * 0.025;

    return nishabEmas;
  }

  resetnishabPerak() async {
    //print("Nishab Emas");
    nishabPerak = 0;

    //nishabEmas = StringExtensions(jmlemasC.text).parseDouble() * 0.025;

    return nishabPerak;
  }

  //bikin fungsi simpan zakat emasperak
  simpanzemasperak() async {
    var nama = namaC.text;
    var jmlemas = jmlemasC.text;
    var jmlperak = jmlperakC.text;
    // var zakatemas = zakatemasC.text;
    // var zakatperak = zakatperakC.text;
    var zakatemas = nishabEmas;
    var zakatperak = nishabPerak;

    //ambil dari id memtode
    var metode = Input.get("metode");

    await FirebaseFirestore.instance.collection("zakat_emas_perak").add({
      "nama": nama,
      "jmlemas": jmlemas, //connvert dari string ke integer
      "jmlperak": jmlperak,
      "zakatemas": zakatemas,
      "zakatperak": zakatperak,
      "metode": metode,
      "created_at": DateTime.now(),
      //"price": 25,
      "user": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "email": FirebaseAuth.instance.currentUser!.email,
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ZakatNavbarDashboardView()),
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Berhasil tambah data Zakat Emas Perak",
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    ));
  }

  // //bikin fungsi simpan zakat emasperak
  // simpanzemasperak() async {
  //   var nama = namaC.text;
  //   var jmlemas = jmlemasC.text;
  //   var jmlperak = jmlperakC.text;
  //   var zakatemas = nishabEmas;
  //   var zakatperak = nishabPerak;
  //   // var zakatemas = zakatemasC.text;
  //   // var zakatperak = zakatperakC.text;

  //   //ambil dari id memtode
  //   var metode = Input.get("metode");

  //   await FirebaseFirestore.instance.collection("zakat_emas_perak").add({
  //     "nama": nama,
  //     "jmlemas": jmlemas, //connvert dari string ke integer
  //     "jmlperak": jmlperak,
  //     "zakatemas": jmlemas,
  //     "zakatperak": jmlperak,
  //     "metode": metode,
  //     "created_at": DateTime.now(),
  //     //"price": 25,
  //     "user": {
  //       "uid": FirebaseAuth.instance.currentUser!.uid,
  //       "name": FirebaseAuth.instance.currentUser!.displayName,
  //       "email": FirebaseAuth.instance.currentUser!.email,
  //     }
  //   });

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const ZakatNavbarDashboardView()),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text(
  //       "Berhasil tambah data Zakat Emas Perak",
  //       style: TextStyle(
  //         fontSize: 15.0,
  //       ),
  //     ),
  //   ));
  // }

}
