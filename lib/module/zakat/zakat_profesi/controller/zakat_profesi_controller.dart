import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/core.dart';
import 'package:example/string_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ZakatProfesiController extends State<ZakatProfesiView>
    implements MvcController {
  static late ZakatProfesiController instance;
  late ZakatProfesiView view;

  //kalau tipenya integer dia tidak bisa hitung nishabnya
  double zperbulan = 0;
  double zpertahun = 0;

  TextEditingController namaC = TextEditingController();
  TextEditingController gajiperbulanC = TextEditingController();
  TextEditingController gajiperTahunC = TextEditingController();
  // TextEditingController zperbulanC = TextEditingController();
  // TextEditingController zpertahunC = TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  zakatbulanan() async {
    //print("Nishab Emas");
    zperbulan = StringExtensions(gajiperbulanC.text).parseDouble() * 0.025;

    //nishabEmas = StringExtensions(jmlemasC.text).parseDouble() * 0.025;

    return zperbulan;
  }

  zakattahunan() async {
    //print("Nishab Emas");
    zpertahun = StringExtensions(gajiperTahunC.text).parseDouble() * 0.025;

    //nishabEmas = StringExtensions(jmlemasC.text).parseDouble() * 0.025;

    return zpertahun;
  }

  resetnishabbulanan() async {
    zperbulan = 0;

    return zperbulan; //menampilkan nilai
  }

  resetnishabtahunan() async {
    zpertahun = 0;

    return zpertahun;
  }

  simpanzprofesi() async {
    //validasi sudah dilakukan di form
    //enggak perlu try catch

    //ambil  dari text editing controller
    var nama = namaC.text;
    var gajiperbulan = gajiperbulanC.text;
    var gajipertahun = gajiperTahunC.text;
    //kalau tipenya int, pakai int parse buat convert ke int
    //kalau tipenya doouble, pakai int parse buat convert ke double
    var zakatnishabbulan = zperbulan;
    var zakatnishabtahun = zpertahun;
    //ambil dari id metode
    var metode = Input.get("metode");

    //fireadd tab
    await FirebaseFirestore.instance.collection("zakat_profesi").add({
      "nama": nama,
      "gaji_per_bulan": gajiperbulan,
      "gaji_per_tahun": gajipertahun,
      "zakat_per_bulan": zakatnishabbulan,
      "zakat_per_tahun": zakatnishabtahun,
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
        "Berhasil Tambah Data Zakat Profesi",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating, //pesannya muncul diatas
    ));
  }
}
