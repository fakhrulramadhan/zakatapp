import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/list_zakat_emas_controller.dart';

class ListZakatEmasView extends StatefulWidget {
  const ListZakatEmasView({Key? key}) : super(key: key);

  Widget build(context, ListZakatEmasController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          title: const Text("List Muzakki Zakat Emas"),
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("zakat_emas_perak")
                        .snapshots(), //utk ditaruh di snapshots
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("Tidak ada data");
                      }

                      // if (snapshot.connectionState == ConnectionState.done) {
                      //   QuerySnapshot.data!.docs.forEach((doc) {
                      //     sumTotal = sumTotal +
                      //         doc["SellingPrice"]; // make sure you create the variable sumTotal somewhere
                      //   });
                      // }

                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          //buat data map dulu {nama: "Fakhrul"}
                          Map<String, dynamic> item =
                              (data.docs[index].data() as Map<String, dynamic>);

                          //munculiin datanya sesuai urutan index
                          //sebagai inisiasi utk menampilkan data sesuai field
                          item["id"] = data.docs[index].id;

                          var id = item["id"];
                          var no = data.docs[index].id;
                          var nama = item["nama"];
                          var jmlemas = item["jmlemas"];
                          var jmlperak = item["jmlperak"];
                          var zakatemas = item["zakatemas"];
                          var zakatperak = item["zakatperak"];
                          var metode = item["metode"];
                          var created_at = item["created_at"];
                          var uid = item["user"]["uid"];

                          //totalnominal = double.parse(item["nominal"]);

                          return Card(
                            child: ListTile(
                              title: Text(
                                "$id",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 17.0,
                                  ),
                                  Text(
                                    "$nama",
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Text(
                                    "$zakatemas",
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Text(
                                    "$zakatperak",
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      //based no document
                                      controller.reportzakatEmasSatuan(no);
                                    },
                                    icon: const Icon(
                                      Icons.report,
                                      size: 24.0,
                                    ),
                                    label: const Text("Lap"),
                                  )
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "$metode",
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),

                                  // SizedBox(
                                  //   width: 20,
                                  //   height: 50,
                                  //   child: ElevatedButton(
                                  //     onPressed: () {
                                  //       //controller.reportFitrahId();
                                  //     },
                                  //     child: const Icon(
                                  //       Icons.print,
                                  //       size: 24.0,
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.reportzakatEmaz();
                      },
                      icon: const Icon(
                        Icons.report,
                        size: 24.0,
                      ),
                      label: const Text(
                        "Laporan",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    // Text(
                    //   "${controller.getNominal()}",
                    //   style: const TextStyle(
                    //     fontSize: 15.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    FutureBuilder(
                      future: controller.zakatNominal(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error");
                        }
                        return Text(
                          "Total Zakat Emas (Kg):${snapshot.data}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        );
                      },
                    ),

                    FutureBuilder(
                      future: controller.zakatNominaled(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error");
                        }
                        return Text(
                          "Total Zakat Perak (Kg):${snapshot.data}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        );
                      },
                    ),

                    // StreamBuilder<QuerySnapshot>(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("zakat_fitrah")
                    //         .where("nominal",)
                    //         .snapshots(),
                    //     builder: (context, snapshot) {
                    //       return const Text(
                    //         "text",
                    //         style: TextStyle(
                    //           fontSize: 15.0,
                    //         ),
                    //       );
                    //     }),
                  ]),
            ],
          ),
        ));
  }

  @override
  State<ListZakatEmasView> createState() => ListZakatEmasController();
}
