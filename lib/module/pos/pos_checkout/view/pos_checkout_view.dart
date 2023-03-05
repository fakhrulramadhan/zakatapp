// import 'package:flutter/material.dart';
// import 'package:example/core.dart';

// class PosCheckoutView extends StatefulWidget {
//   const PosCheckoutView({Key? key}) : super(key: key);

//   Widget build(context, PosCheckoutController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PosCheckout"),
//         actions: const [],
//       ),
//       body: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(13.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   //itemcount dapat dari poscontroller
//                   //utk menampilkan jumlah barnag yang dibeli
//                   itemCount: PosController.instance.products.length,
//                   //shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     //var item utk mengambil data per produk
//                     var item = PosController.instance.products[index];

//                     //jika item yang dibeli qty 0, maka pasang container saja
//                     //dan datanya tidak tampil
//                     if (item["qty"] == 0) return Container();

//                     //menampilkan total  harga,parse dari double ke stirng
//                     var total_price = int.parse(item["qty"].toString()) *
//                         int.parse(item["price"].toString());
//                     return Card(
//                       //menampilkan data per  produk yang dibeli
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(2.0),
//                         title: Text("${item['product_name']}"),
//                         subtitle: Text("${item['qty']} x ${item['price']}"),
//                         trailing: Text("$total_price"),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               //metod pembayara bikin pakai combo f_combo tab / f_radio tab
//               //method pembayaran masih manual
//               const ExRadio(
//                 id: "payment_method",
//                 label: "Payment method",
//                 items: [
//                   {
//                     "label": "Cash",
//                     "value": "Cash",
//                   },
//                   {
//                     "label": "Credit Card",
//                     "value": "Credit Card",
//                   },
//                   {
//                     "label": "OVO",
//                     "value": "OVO",
//                   },
//                   {
//                     "label": "Dana",
//                     "value": "Dana",
//                   },
//                   {
//                     "label": "Gopay",
//                     "value": "Gopay",
//                   }
//                 ],
//                 value: "Cash",
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               ListTile(
//                 //kasih jarak dengan nomor mejanya
//                 contentPadding: const EdgeInsets.all(2.0),
//                 title: const Text("Nomor Meja"),
//                 //menampillkan nomor meja yang dipesan dari postablecontroller
//                 trailing: Text(
//                   //manfaatnya dependency injection, getx provider utk ambil data
//                   //dari controller lain
//                   "${PosTableController.instance.selectedTable}",
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               ListTile(
//                 contentPadding: const EdgeInsets.all(2.0),
//                 title: const Text("Total Harga"),
//                 trailing: Text(
//                   "${PosController.instance.total_price}",
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               //button_icon tab
//               //checkout akan disimpan ke firebase
//               SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 child: ElevatedButton.icon(
//                   icon: const Icon(Icons.check),
//                   label: const Text("Checkout"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueGrey,
//                   ),
//                   onPressed: () {
//                     controller.doCheckout();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   State<PosCheckoutView> createState() => PosCheckoutController();
// }
