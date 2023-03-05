import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:example/core.dart';

class PosOrderListView extends StatefulWidget {
  const PosOrderListView({Key? key}) : super(key: key);

  Widget build(context, PosOrderListController controller) {
    controller.view = this;

    //utk checkin checkout meja

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pos Order List"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //streambuilder utk menampilkan meja mana saja
            //yang tersedia / dibooking
            //tadi listnya ennggak muncul karena blm ada expaded
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("pos_orders")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      //menampung semua data collection pos_orders
                      item["id"] = data.docs[index].id;
                      /* 
                      {
                        "created_at": Timestamp.now(), //tanggal transaksi
      "table_number": PosTableController
          .instance.selectedTable, //diambil dari posttablecontroller
      "payment_method": payment_method,
      //item yang dipesan
      "items": PosController.instance.products.length,
      //ambil total  harga
      "total_price": PosController.instance.total_price,
      //penjual / kasir diambil dari data kita sendiri, uid dan nama
      "seller": {
        //fireuser tab
        "uid": FirebaseAuth.instance.currentUser!.uid,
        //kalau enggak ada ganti strip
        "name": FirebaseAuth.instance.currentUser!.displayName ?? "-",
        "email": FirebaseAuth.instance.currentUser!.email ?? "-",
                      }
                      */

                      // var created_at = (item["created_at"] as Timestamp).toDate();
                      // var fCreated_at =
                      //     DateFormat('d MMM y kk:ss').format(created_at);

                      //atau dengan cara pakai extension
                      //ke util -> common -> common.dart
                      //var nama var = item firebase['nama_field']
                      // var created_at =
                      //     (item["created_at"] as Timestamp).toDate().dMMMykkss;

                      //cara panggil field dari firebase, sudah dari item
                      var total_price = item["total_price"];
                      var payment_method = item["payment_method"];
                      var table_number = item["table_number"];
                      var id = item["id"];
                      //cara panggil nama nested map  (map di dalam map)
                      var name = item["seller"]["name"];

                      return Card(
                        child: ListTile(
                          // leading: CircleAvatar(
                          //   backgroundColor: Colors.grey[200],
                          //   backgroundImage: const NetworkImage(
                          //     "https://i.ibb.co/QrTHd59/woman.jpg",
                          //   ),
                          // ),
                          // title: Text("$name"),
                          title: Text("$id"),
                          subtitle: Column(
                            //cross itu kebalikannya dari orientasi kolom
                            //kolomkebawah, cross (row) kesamping
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              //wrap pakai column
                              Text("$total_price"),
                              Text("$payment_method"),
                              Text("$table_number")
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text("$created_at"),
                              const Text("Kasir: "),
                              Text("$name "),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<PosOrderListView> createState() => PosOrderListController();
}
