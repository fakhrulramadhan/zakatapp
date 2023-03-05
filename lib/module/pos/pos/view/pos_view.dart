// import 'package:flutter/material.dart';
// import 'package:example/core.dart';

// class PosView extends StatefulWidget {
//   const PosView({Key? key}) : super(key: key);

//   Widget build(context, PosController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Pos"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.table_bar_rounded),
//               //menampilkan nomor meja yang dipilih
//               label: Text("${PosTableController.instance.selectedTable}"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueGrey,
//               ),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 6.0,
//                 horizontal: 12.0,
//               ),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20.0),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.search,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                   Expanded(
//                     child: TextFormField(
//                       initialValue: null,
//                       decoration: InputDecoration.collapsed(
//                         filled: true,
//                         fillColor: Colors.transparent,
//                         hintText: "What are you craving?",
//                         hintStyle: TextStyle(
//                           color: Colors.grey[500],
//                         ),
//                         hoverColor: Colors.transparent,
//                       ),
//                       onFieldSubmitted: (value) {
//                         //menangkap value pada nama produk yang dicari
//                         controller.cari = value;
//                         controller.update();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             //data prduk diwrap dengan streambuilder agar dapat load data
//             //dari firebase
//             Expanded(
//                 child: ListView.builder(
//               //panggil variabel products
//               itemCount: controller.products.length,
//               itemBuilder: (context, index) {
//                 Map<String, dynamic> item =
//                     controller.products[index]; //menampiung data ke berapa

//                 //jika field carinya keisi dan product yang dicari tidak ada,
//                 //maka  tidak akan menampilkan apa  apa
//                 if (controller.cari.isNotEmpty) {
//                   //jika product_name lowercase mengandung (kata yang dicari)
//                   //dari textfield cari yang diketik menjadi huruf kecil
//                   if (!item["product_name"]
//                       .toString()
//                       .toLowerCase()
//                       .contains(controller.cari.toLowerCase())) {
//                     return Container();
//                   }
//                 }
//                 return Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 90,
//                           height: 90,
//                           margin: const EdgeInsets.only(right: 10.0),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 //kalau enggak ada fotonya pakai no image
//                                 item["photo"] ??
//                                     "https://i.ibb.co/S32HNjD/no-image.jpg", //nama fieldya photo
//                               ),
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(16.0),
//                             ),
//                             color: Colors.blue[400],
//                           ),
//                           child: Stack(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(6.0),
//                                 margin: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green[800],
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(
//                                       12.0,
//                                     ),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   "PROMO",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 //"Roti bakar Cimanggis",
//                                 item["product_name"] ?? "-",
//                                 style: const TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 6.0,
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     "8.1 km",
//                                     style: TextStyle(
//                                       fontSize: 10.0,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 4.0,
//                                   ),
//                                   const Icon(
//                                     Icons.circle,
//                                     size: 4.0,
//                                   ),
//                                   const SizedBox(
//                                     width: 4.0,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.orange[400],
//                                     size: 16.0,
//                                   ),
//                                   const Text(
//                                     "4.8",
//                                     style: TextStyle(
//                                       fontSize: 10.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 6.0,
//                               ),
//                               Text(
//                                 item["category"] ?? " - ",
//                                 style: const TextStyle(
//                                   fontSize: 10.0,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 6.0,
//                               ),
//                               Text(
//                                 "Rp. ${item['price']}",
//                                 style: const TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 6.0,
//                         ),
//                         Row(
//                           //bikin jadi rata tengah (horizontal)
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           //rata tengah secara vertikal
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             //bikin icon button utk add dan remove,
//                             //iconbutton tab
//                             IconButton(
//                                 onPressed: () {
//                                   //buat validasi
//                                   if (item['qty'] == 0) {
//                                     //langsung return supaya enggak bisa dikurang
//                                     return;
//                                   } else {
//                                     //langsungi dikurangi dari list item firebase
//                                     item['qty']--;
//                                     controller.update();
//                                   }
//                                 },
//                                 icon: const Icon(Icons.remove)),
//                             //pilih mejanya dulu agar bisa pesan mejanya dulu
//                             //karena banyak pelanggan yang pesan makanannya
//                             //lewat waiter, utk mengunci meja agar tidak bisa
//                             // di book orang lain
//                             //textb tab
//                             //kalau item qtnya enggak ada,langsung 0
//                             Text(
//                               "${item['qty'] ?? "0"}",
//                               style: const TextStyle(
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   //langsungi ditambahi dari list item firebase
//                                   item['qty']++;
//                                   controller.update();
//                                 },
//                                 icon: const Icon(Icons.add))
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 90,
//         width: MediaQuery.of(context).size.width, //w100  tab
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           //sebelumnya column
//           //berorienntasi ke bawah
//           // mainAxisAlignment: MainAxisAlignment.end,
//           // //berorientasi ke samping (Horizonal) harga di samping kanan
//           // crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             //menampilkan total  harga dari controller,
//             //di samping kiri button
//             Text(
//               "Rp. ${controller.total_price}",
//               style: const TextStyle(
//                 fontSize: 23.0,
//               ),
//             ),
//             // const SizedBox(
//             //   height: 7.0,
//             // ),
//             const SizedBox(
//               width: 18.0,
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 90,
//                 width: 90,
//                 child: ElevatedButton.icon(
//                   icon: const Icon(Icons.check),
//                   label: const Text("Checkout"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const PosCheckoutView()),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   State<PosView> createState() => PosController();
// }
