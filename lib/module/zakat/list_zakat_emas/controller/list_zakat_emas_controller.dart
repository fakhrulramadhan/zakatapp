import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/module/zakat/list_zakat_emas/model/list_zakat_emas_model.dart';
import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/list_zakat_emas_view.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ListZakatEmasController extends State<ListZakatEmasView>
    implements MvcController {
  static late ListZakatEmasController instance;
  late ListZakatEmasView view;

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

  List<ZakatEmasModel> allZakatEmas = [];
  List<ZakatEmasModel> allZakatEmaz = [];

  //kalau output di simpan data zakatnya double
  //maka di methodnya juga tipenya juga harus num
  //agar bisa dapatin jumlahin angkanya
  Future<num> zakatNominal() async {
    num jumlah = 0;

    final zakatemasCollection =
        await FirebaseFirestore.instance.collection("zakat_emas_perak").get();

    // final docs = zakatfitrahCollection.docs.where((element) => element
    //     .data()['created_at']
    //     .toString()
    //     .contains(DateFormat('yyyy-MM-dd').format(DateTime.now())));

    final docs = zakatemasCollection.docs;

    print(docs);

    for (var element in docs) {
      final dynamic totzakatemas = element.data()['zakatemas'];

      jumlah += totzakatemas.toInt(); // ke int,agar komanya hilang
      //print(sum);
    }

    print(jumlah);

    return jumlah;
  }

  Future<num> zakatNominaled() async {
    num jumlahperak = 0;

    final zakatperakCollection =
        await FirebaseFirestore.instance.collection("zakat_emas_perak").get();

    // final docs = zakatfitrahCollection.docs.where((element) => element
    //     .data()['created_at']
    //     .toString()
    //     .contains(DateFormat('yyyy-MM-dd').format(DateTime.now())));

    final docs = zakatperakCollection.docs;

    print(docs);

    for (var element in docs) {
      final dynamic totzakatemas = element.data()['zakatperak'];

      jumlahperak += totzakatemas.toInt(); // ke int,agar komanya hilang
      //print(sum);
    }

    print(jumlahperak);

    return jumlahperak;
  }

  void reportzakatEmas() async {
    final pdf = pw.Document();

    dynamic hitung = 0; //sebaiknya tipenya num
    num hitunged = 0; //sebaiknya tipenya num

    var getData = await firestore.collection("zakat_emas_perak").get();

    //print(getData);

    //reset semua data, utk mencegah duplikat
    allZakatEmas.clear();

    //perulangan utk menampilkan semua data
    for (var element in getData.docs) {
      //masukkin field firebase ke mdel
      allZakatEmas.add(ZakatEmasModel.fromJson(element.data()));

      //lakukan kalkulasi total zakat,pakai num soalnya double
      final dynamic totalzakatemas = element.data()['zakatemas'];

      //final num totalzakatperak = element.data()['zakatperak'];
      //yang direturn hitungnya ke text
      hitung += totalzakatemas;
      //hitunged += totalzakatperak;
    }

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      build: (context) {
        List<pw.TableRow> allData = List.generate(allZakatEmas.length, (index) {
          ZakatEmasModel zakatEmasdata = allZakatEmas[index];

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
              child: pw.Text(zakatEmasdata.nama,
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text(zakatEmasdata.jmlemas.toString(),
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text(zakatEmasdata.jmlperak.toString(),
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),

            //nominal
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(zakatEmasdata.zakatemas,
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            //metode
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(zakatEmasdata.zakatperak,
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(zakatEmasdata.metode,
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
            pw.Text("Total Zakat Emas",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 8),
            pw.Text("$hitung",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 19),
            // pw.Text("Total Zakat Perak",
            //     style:
            //         pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            // pw.SizedBox(width: 8),
            // pw.Text("$hitunged",
            //     style:
            //         pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
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
                      child: pw.Text("Jumlah Emas",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Jumlah Perak",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  //Nominal
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Emas",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Perak",
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

  void reportzakatEmaz() async {
    final pdf = pw.Document();

    num hitung = 0; //sebaiknya tipenya num
    num hitungs = 0; //sebaiknya tipenya num

    var getData = await firestore.collection("zakat_emas_perak").get();

    //reset semua data, utk mencegah duplikat
    allZakatEmaz.clear();

    print(getData.docs);

    //perulangan utk menampilkan semua data
    for (var element in getData.docs) {
      //masukkin field firebase ke mdel
      allZakatEmaz.add(ZakatEmasModel.fromJson(element.data()));

      //lakukan kalkulasi total zakat,pakai num soalnya double
      final num totalzakatemas = element.data()['zakatemas'];

      //final num totalzakatperak = element.data()['zakat_per_tahun'];
      //yang direturn hitungnya ke text
      hitung += totalzakatemas;
      //hitungs += totalzakatperak;
    }

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      build: (context) {
        List<pw.TableRow> allData = List.generate(allZakatEmaz.length, (index) {
          ZakatEmasModel zakatEmazdata = allZakatEmaz[index];

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
              child: pw.Text(zakatEmazdata.nama,
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text(zakatEmazdata.jmlemas.toString(),
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Text(zakatEmazdata.jmlperak.toString(),
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 15)),
            ),

            //nominal
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text("${zakatEmazdata.jmlemas}",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            //metode
            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text("${zakatEmazdata.jmlperak}",
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12))),

            pw.Padding(
                padding: const pw.EdgeInsets.all(20),
                child: pw.Text(zakatEmazdata.metode,
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(fontSize: 12)))
          ]);
        });

        //disini utk bikin tampilan reportnya
        return [
          pw.Center(
              child: pw.Text("Report Zakat Emas Perak",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(fontSize: 23))),
          pw.SizedBox(height: 22),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Text("Total Zakat Emas",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 8),
            pw.Text("$hitung",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(width: 19),
            // pw.Text("Total Zakat Perak",
            //     style:
            //         pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            // pw.SizedBox(width: 8),
            // pw.Text("$hitungs",
            //     style:
            //         pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
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
                      child: pw.Text("Jml Emas",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Jml Perak",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  //Nominal
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Jml Zakat Emas",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Jml Zakat Perak",
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

  void reportzakatEmasSatuan(String no) async {
    print(no);
    final pdf = pw.Document();

    allZakatEmas.clear(); //pakai clear supaya data sebelumnya kehapus

    // no itu sama aja dengan uid,  where ambil berdasarkan uid
    var getData = await firestore.collection("zakat_emas_perak").doc(no).get();
    print(getData);

    Map<String, dynamic>? data = getData.data();

    print(data);

    dynamic tot_zakatemas = data!["zakatemas"];
    dynamic tot_zakatperak = data["zakatperak"];
    dynamic tot_jmlemas = data["jmlemas"];
    dynamic tot_jmlperak = data["jmlperak"];

    dynamic nominal_jmlemas = tot_jmlemas;
    dynamic nominal_jmlperak = tot_jmlperak;
    dynamic nominal_zakatemas = tot_zakatemas;
    dynamic nominal_zakatperak = tot_zakatperak;

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
      pageFormat: PdfPageFormat.a3,
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
                      child: pw.Text("Jml Emas:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text(
                          nominal_jmlemas == 0 ? "0" : "${data['jmlemas']}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Jml Perak:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text(
                          nominal_jmlperak == "" ? "0" : "${data['jmlperak']}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Emas:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("${data['zakatemas']}",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.normal))),
                ]),
                pw.TableRow(children: [
                  //Metode
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("Zakat Perak:",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))),

                  pw.Padding(
                      padding: const pw.EdgeInsets.all(20),
                      child: pw.Text("${data['zakatperak']}",
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
