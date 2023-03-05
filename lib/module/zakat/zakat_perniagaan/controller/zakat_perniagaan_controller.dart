import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/core.dart';
import 'package:example/string_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ZakatPerniagaanController extends State<ZakatPerniagaanView>
    implements MvcController {
  static late ZakatPerniagaanController instance;
  late ZakatPerniagaanView view;

  TextEditingController namaC = TextEditingController();
  TextEditingController asetlaC = TextEditingController();
  TextEditingController hutangjapeC = TextEditingController();
  TextEditingController nishabC = TextEditingController();

  double nishab = 0.0; //sebagai penampungan data hitungnishab

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  hitungnishab() async {
    //pakai string extensions agar bisa convert dari srtring ke angka
    //(integer / double)

    //jml aset lancar - jml hutang jangka pendek * 2,5 %
    nishab = (StringExtensions(asetlaC.text).parseDouble() -
            StringExtensions(hutangjapeC.text).parseDouble()) *
        0.025; //zakat 2,5% (dikali 0,025)

    //print(nishab);

    return nishab;
  }

  simpanzperniagaan() async {
    //validasi sudah dilakukan di form
    //enggak perlu try catch

    //ambil  dari text editing controller
    var nama = namaC.text;
    var asetla = StringExtensions(asetlaC.text).parseInt();
    var hutangjape = StringExtensions(hutangjapeC.text).parseInt();
    var nishabs = nishab;
    //var nishab = StringExtensions(nishabC.text).parseInt();//salah ambil data
    //ambil dari id metode
    var metode = Input.get("metode");

    //fireadd tab
    await FirebaseFirestore.instance.collection("zakat_perniagaan").add({
      "nama": nama,
      "aset_lancar": asetla,
      "hutang_jangka_pendek": hutangjape,
      "tot_zakat_perniagaan": nishabs, //diambil dari nishab
      "metode": metode,
      "created_at": DateTime.now(),

      //utk simpan data user yang input data
      "user": {
        //ngambil data user
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
        "Berhasil Tambah Data Zakat Perniagaan",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating, //pesannya muncul diatas
    ));
  }
}
