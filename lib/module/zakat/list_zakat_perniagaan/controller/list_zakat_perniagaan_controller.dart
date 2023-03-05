import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/module/zakat/list_zakat_perniagaan/model/zakat_perniagaan_model.dart';
import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../../list_zakat_fitrah/model/zakat_fitrah_model.dart';
import '../view/list_zakat_perniagaan_view.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ListZakatPerniagaanController extends State<ListZakatPerniagaanView>
    implements MvcController {
  static late ListZakatPerniagaanController instance;
  late ListZakatPerniagaanView view;

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List nominal = [];

  //double sum = 0;
  double total = 0;
  double totalniaga = 0;

  final String userid = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<ZakatPerniagaanModel> allZakatPerniagaan = [];
  List<ZakatFitrahModel> allZakatFitrah = [];

  @override
  void initState() {
    instance = this;

    //totalzaper();

    //queryValues();

    // FirebaseFirestore.instance.collection('zakat_fitrah').get().then(
    //   (querySnapshot) {
    //     for (var result in querySnapshot.docs) {
    //       sum = sum + result.data()['nominal'];
    //     }
    //     setState(() {
    //       total = sum;
    //     });

    //     print(total.toString());

    //     return total;
    //   },
    // );
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  //kalau output di simpan data zakatnya double
  //maka di methodnya juga tipenya juga harus num
  //agar bisa dapatin jumlahin angkanya
  Future<num> zakatNominal() async {
    num sum = 0;

    final zakatniagaCollection =
        await FirebaseFirestore.instance.collection("zakat_perniagaan").get();

    // final docs = zakatfitrahCollection.docs.where((element) => element
    //     .data()['created_at']
    //     .toString()
    //     .contains(DateFormat('yyyy-MM-dd').format(DateTime.now())));

    final docs = zakatniagaCollection.docs;

    //print(docs);

    for (var element in docs) {
      final num totalzakat = element.data()['tot_zakat_perniagaan'];
      sum += totalzakat.toInt(); // ke int,agar komanya hilang
      //print(sum);
    }

    print(sum);

    return sum;
  }

  void reportNiaga() async {
    final pdf = pw.Document();

    num hitung = 0; //sebaiknya tipenya num

    var getData = await firestore.collection("zakat_perniagaan").get();

    //reset semua data, utk mencegah duplikat
    allZakatPerniagaan.clear();

    //perulangan utk menampilkan semua data
    for (var element in getData.docs) {
      //masukkin field firebase ke mdel
      allZakatPerniagaan.add(ZakatPerniagaanModel.fromJson(element.data()));

      //lakukan kalkulasi total zakat,pakai num soalnya double
      final num totalniaga = element.data()['tot_zakat_perniagaan'];
      //yang direturn hitungnya ke text
      hitung += totalniaga;
    }

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      build: (context) {
        List<pw.TableRow> allData =
            List.generate(allZakatPerniagaan.length, (index) {
          ZakatPerniagaanModel zakatPerniagaan = allZakatPerniagaan[index];

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
              child: pw.Text(zakatPerniagaan.nama,
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text("${zakatPerniagaan.aset_lancar}",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text("${zakatPerniagaan.hutang_jangka_pendek}",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),

            //nominal
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text("${zakatPerniagaan.tot_zakat_perniagaan}",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            //metode
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(zakatPerniagaan.metode,
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
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
            pw.Text("Total Zakat Perniagaan",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 18),
            pw.Text("$hitung")
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
                      child: pw.Text("Aset Lancar",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Hutang J.Pendek",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  //Nominal
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Nominal",
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

  void reportzakatPerniagaanSatuan(String no) async {
    print(no);
    final pdf = pw.Document();

    allZakatPerniagaan.clear(); //pakai clear supaya data sebelumnya kehapus

    // no itu sama aja dengan uid,  where ambil berdasarkan uid
    var getData = await firestore.collection("zakat_perniagaan").doc(no).get();
    print(getData);

    Map<String, dynamic>? data = getData.data();

    num tot_zakat = data!["tot_zakat_perniagaan"];
    num nominal = tot_zakat.toInt();

    print(data);
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
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        //disini utk bikin tampilan reportnya
        return [
          pw.Center(
              child: pw.Text("Bukti Zakat Fitrah\n DKM Al Ridwan",
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
                      child: pw.Text("Nominal",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("$nominal",
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
