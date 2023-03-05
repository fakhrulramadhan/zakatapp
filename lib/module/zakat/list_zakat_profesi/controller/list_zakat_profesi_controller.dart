import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/module/zakat/list_zakat_perniagaan/model/zakat_perniagaan_model.dart';
import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/list_zakat_profesi_view.dart';
import '../model/list_zakat_profesi_model.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ListZakatProfesiController extends State<ListZakatProfesiView>
    implements MvcController {
  static late ListZakatProfesiController instance;
  late ListZakatProfesiView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List nominal = [];

  //double sum = 0;
  double total = 0;
  double totalemas = 0;

  final String userid = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<ZakatProfesiModel> allZakatProfesi = [];
  List<ZakatPerniagaanModel> allZakatPerniagaan = [];

  //kalau output di simpan data zakatnya double
  //maka di methodnya juga tipenya juga harus num
  //agar bisa dapatin jumlahin angkanya
  Future<num> zakatNominalBulan() async {
    num sum = 0;

    final zakatprofesiCollection =
        await FirebaseFirestore.instance.collection("zakat_profesi").get();

    // final docs = zakatfitrahCollection.docs.where((element) => element
    //     .data()['created_at']
    //     .toString()
    //     .contains(DateFormat('yyyy-MM-dd').format(DateTime.now())));

    final docs = zakatprofesiCollection.docs;

    //print(docs);

    for (var element in docs) {
      final num totzakatemas = element.data()['zakat_per_bulan'];

      sum += totzakatemas.toInt(); // ke int,agar komanya hilang
      //print(sum);
    }

    print(sum);

    return sum;
  }

  Future<num> zakatNominalTahun() async {
    num summed = 0;

    final zakatemasCollection =
        await FirebaseFirestore.instance.collection("zakat_profesi").get();

    // final docs = zakatfitrahCollection.docs.where((element) => element
    //     .data()['created_at']
    //     .toString()
    //     .contains(DateFormat('yyyy-MM-dd').format(DateTime.now())));

    final docs = zakatemasCollection.docs;

    //print(docs);

    for (var element in docs) {
      final num totzakatemas = element.data()['zakat_per_tahun'];

      summed += totzakatemas.toInt(); // ke int,agar komanya hilang
      //print(sum);
    }

    print(summed);

    return summed;
  }

  void reportzakatProfesi() async {
    final pdf = pw.Document();

    num hitung = 0; //sebaiknya tipenya num
    num hitungs = 0; //sebaiknya tipenya num

    var getData = await firestore.collection("zakat_profesi").get();

    //reset semua data, utk mencegah duplikat
    allZakatProfesi.clear();

    //perulangan utk menampilkan semua data
    for (var element in getData.docs) {
      //masukkin field firebase ke mdel
      allZakatProfesi.add(ZakatProfesiModel.fromJson(element.data()));

      //lakukan kalkulasi total zakat,pakai num soalnya double
      final num totalzakatbulan = element.data()['zakat_per_bulan'];

      final num totalzakatperak = element.data()['zakat_per_tahun'];
      //yang direturn hitungnya ke text
      hitung += totalzakatbulan;
      hitungs += totalzakatperak;
    }

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      build: (context) {
        List<pw.TableRow> allData =
            List.generate(allZakatProfesi.length, (index) {
          ZakatProfesiModel zakatProfesidata = allZakatProfesi[index];

          return pw.TableRow(children: [
            //utk urutan nomor
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(" ${index + 1}",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            //nama muzakki
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text(zakatProfesidata.nama,
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text("${zakatProfesidata.gaji_per_bulan}",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text("${zakatProfesidata.gaji_per_tahun}",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),

            //nominal
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text("${zakatProfesidata.zakat_per_bulan}",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            //metode
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text("${zakatProfesidata.zakat_per_tahun}",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(zakatProfesidata.metode,
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12)))
          ]);
        });

        //disini utk bikin tampilan reportnya
        return [
          pw.Center(
              child: pw.Text("Report Zakat Perniagaan",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 23))),
          pw.SizedBox(height: 22),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Text("Total Zakat Per BUlan",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 8),
            pw.Text("$hitung",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 19),
            pw.Text("Total Zakat Perak",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 8),
            pw.Text("$hitungs",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          ]),
          pw.SizedBox(height: 22),
          pw.Table(
              border: pw.TableBorder.all(
                  color: PdfColor.fromHex("#000000"), width: 3),
              children: [
                pw.TableRow(children: [
                  //utk nomor
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("No:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  //Nama Muzakki
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Nama",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Gaji Per Bulan",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Gaji Per Tahun",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  //Nominal
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Per Bulan",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Per Tahun",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Metode",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),
                ]),
                ...allData,
              ])
        ];
      },
    ));

    //simpan
    Uint8List bytes = await pdf.save();

    //buat file kosong di direktooori
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${DateTime.now()}.pdf');

    await file.writeAsBytes(bytes);

    //open pdf
    await OpenFile.open(file.path);
  }

  void reportzakatProfesiSatuan(String no) async {
    print(no);
    final pdf = pw.Document();

    allZakatProfesi.clear(); //pakai clear supaya data sebelumnya kehapus

    // no itu sama aja dengan docid,  where ambil berdasarkan uid
    var getData = await firestore.collection("zakat_profesi").doc(no).get();

    Map<String, dynamic>? data = getData.data();
    print(data);

    //pakai num agar gajinya muncul
    dynamic tot_gajiperbulan = data!["gaji_per_bulan"];
    dynamic tot_gajipertahun = data["gaji_per_tahun"];
    dynamic tot_zakatbulan = data["zakat_per_bulan"];
    dynamic tot_zakatpertahun = data["zakat_per_tahun"];

    dynamic nominal_gajibulan = tot_gajiperbulan;
    dynamic nominal_gajitahun = tot_gajipertahun;
    dynamic nominal_zakatbulan = tot_zakatbulan;
    dynamic nominal_zakattahun = tot_zakatpertahun;

    print(tot_gajiperbulan);
    // print(data!['nama']);

    // // var element = data.length;

    // var getElement = await firestore
    //     .collection("zakat_fitrah")
    //     .where("uid", isEqualTo: uid)
    //     .get();

    // //perulangan utk menampilkan semua data
    // for (var element in getData.data().) {
    //   allZakatFitrah.add(ZakatFitrahModel.fromJson(element.data()));
    // }

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      build: (pw.Context context) {
        //disini utk bikin tampilan reportnya
        return [
          pw.Center(
              child: pw.Text("Bukti Zakat Profesi\n DKM Al Ridwan",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 23))),
          pw.SizedBox(height: 22),
          pw.Table(
              //enggak usah pakai garis
              // border: pw.TableBorder.all(
              //     color: PdfColor.fromHex("#000000"), width: 0),
              children: [
                pw.TableRow(children: [
                  //utk nomor
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Nama:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  //Nama Muzakki
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("${data['nama']}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold,
                          ))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Gaji Per Bulan:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text(
                          nominal_gajibulan == ""
                              ? "0"
                              : "${data["gaji_per_bulan"]}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Gaji Per Tahun:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text(
                          nominal_gajitahun == ""
                              ? "0"
                              : "${data["gaji_per_tahun"]}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Per Bulan:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("${data["zakat_per_bulan"]}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Per Tahun:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("${data["zakat_per_tahun"]}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Metode",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("${data['metode']}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),
                ])
              ]),
          pw.SizedBox(height: 20),
          pw.Text("Jazakallah Khairan Katsiiraan Atas Zakat Anda",
              style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold))
        ];
      },
    ));

    //simpan
    Uint8List bytes = await pdf.save();

    //buat file kosong di direktooori
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${data['nama']}.pdf'); //file sesuai nama

    await file.writeAsBytes(bytes);

    //open pdf
    await OpenFile.open(file.path);
  }
}
