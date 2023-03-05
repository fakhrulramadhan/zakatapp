// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:example/core.dart';

// class PosProductListView extends StatefulWidget {
//   //const PosProductListView({Key? key}) : super(key: key);

//   const PosProductListView({Key? key}) : super(key: key);

//   Widget build(context, PosProductListController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PosProductList"),
//         actions: [
//           //button icon tab
//           ElevatedButton.icon(
//             icon: const Icon(Icons.add),
//             label: const Text("Tambah"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blueGrey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const PosProductFormView()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             ExSearchField(
//               id: "cari",
//               label: "Cari...",
//               onSubmitted: (value) {
//                 controller.cari = value;
//                 controller.update();
//               },
//               backgroundColor: Colors.white,
//               hintText: "Cari Nama Produk...",
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             //data prduk diwrap dengan streambuilder agar dapat load data
//             //dari firebase
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("pos_products")
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) return const Text("Error");
//                   if (snapshot.data == null) return Container();
//                   if (snapshot.data!.docs.isEmpty) {
//                     return const Text("No Data");
//                   }
//                   //meload data sesuai dengan nama produknya
//                   final data = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: data.docs.length,
//                     itemBuilder: (context, index) {
//                       Map<String, dynamic> item =
//                           (data.docs[index].data() as Map<String, dynamic>);
//                       item["id"] = data.docs[index].id;

//                       if (controller.cari.isNotEmpty) {
//                         //jika product_name  (di ! product name). tidakmengandung kata yang dicari, maka cukup keluarin containernya saja
//                         if (!item["product_name"]
//                             .toString()
//                             .toLowerCase()
//                             .contains(controller.cari.toLowerCase())) {
//                           return Container();
//                         }
//                       }
//                       return Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 90,
//                                 height: 90,
//                                 margin: const EdgeInsets.only(right: 10.0),
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(
//                                       //kalau enggak ada fotonya pakai no image
//                                       item["photo"] ??
//                                           "https://i.ibb.co/S32HNjD/no-image.jpg", //nama fieldya photo
//                                     ),
//                                     fit: BoxFit.cover,
//                                   ),
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(16.0),
//                                   ),
//                                   color: Colors.blue[400],
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(6.0),
//                                       margin: const EdgeInsets.all(8.0),
//                                       decoration: BoxDecoration(
//                                         color: Colors.green[800],
//                                         borderRadius: const BorderRadius.all(
//                                           Radius.circular(
//                                             12.0,
//                                           ),
//                                         ),
//                                       ),
//                                       child: const Text(
//                                         "PROMO",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 8.0,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       //"Roti bakar Cimanggis",
//                                       item["product_name"] ?? "-",
//                                       style: const TextStyle(
//                                         fontSize: 14.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 6.0,
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         const Text(
//                                           "8.1 km",
//                                           style: TextStyle(
//                                             fontSize: 10.0,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 4.0,
//                                         ),
//                                         const Icon(
//                                           Icons.circle,
//                                           size: 4.0,
//                                         ),
//                                         const SizedBox(
//                                           width: 4.0,
//                                         ),
//                                         Icon(
//                                           Icons.star,
//                                           color: Colors.orange[400],
//                                           size: 16.0,
//                                         ),
//                                         const Text(
//                                           "4.8",
//                                           style: TextStyle(
//                                             fontSize: 10.0,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 6.0,
//                                     ),
//                                     Text(
//                                       item["category"] ?? " - ",
//                                       style: const TextStyle(
//                                         fontSize: 10.0,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 6.0,
//                                     ),
//                                     Text(
//                                       "Rp. ${item['price']}",
//                                       style: const TextStyle(
//                                         fontSize: 14.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   State<PosProductListView> createState() => PosProductListController();
// }
