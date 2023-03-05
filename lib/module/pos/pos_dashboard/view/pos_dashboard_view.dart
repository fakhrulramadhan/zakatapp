// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:example/core.dart';

// class PosDashboardView extends StatefulWidget {
//   const PosDashboardView({Key? key}) : super(key: key);

//   Widget build(context, PosDashboardController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PosDashboard"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               //menu_image tab..
//               Container(
//                 height: 160.0,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(
//                       16.0,
//                     ),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.black26,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(
//                             16.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 20.0,
//                       top: 0.0,
//                       bottom: 0.0,
//                       child: SizedBox(
//                         width: 100.0,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "30%",
//                               style: GoogleFonts.oswald(
//                                 fontSize: 30.0,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "Discount Only Valid for Today",
//                               style: GoogleFonts.oswald(
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               //row  untuk kartu
//               Row(
//                 children: [
//                   //item_statistic_order tab..

//                   Expanded(
//                     child: Card(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Jumlah Pesanan",
//                                     style: TextStyle(
//                                       fontSize: 12.0,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 6.0,
//                                   ),
//                                   Row(
//                                     children: [
//                                       StreamBuilder<QuerySnapshot>(
//                                         stream: FirebaseFirestore.instance
//                                             .collection("pos_orders")
//                                             .snapshots(),
//                                         builder: (context, snapshot) {
//                                           if (snapshot.hasError) {
//                                             return const Text("Error");
//                                           }
//                                           if (snapshot.data == null) {
//                                             return Container();
//                                           }

//                                           final data = snapshot.data!;
//                                           return Text(
//                                             "${data.docs.length}",
//                                             style: const TextStyle(
//                                               fontSize: 16.0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                       const Text(
//                                         "",
//                                         style: TextStyle(
//                                           fontSize: 10.0,
//                                           color: Colors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(10.0),
//                               decoration: const BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(
//                                     8.0,
//                                   ),
//                                 ),
//                               ),
//                               child: const Icon(
//                                 Icons.list,
//                                 size: 24.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10.0,
//                   ),
//                   Expanded(
//                     child: Card(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         padding: const EdgeInsets.all(7.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     "Your balance",
//                                     style: TextStyle(
//                                       fontSize: 12.0,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 6.0,
//                                   ),
//                                   Row(
//                                     children: const [
//                                       Text(
//                                         "€53,000",
//                                         style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         "+55%",
//                                         style: TextStyle(
//                                           fontSize: 10.0,
//                                           color: Colors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(10.0),
//                               decoration: const BoxDecoration(
//                                 color: Colors.orange,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(
//                                     8.0,
//                                   ),
//                                 ),
//                               ),
//                               child: const Icon(
//                                 Icons.wallet,
//                                 size: 24.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               LayoutBuilder(
//                 builder: (context, constraint) {
//                   List menus = [
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/878/878052.png",
//                       "label": "Products",
//                       "onTap": () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const PosProductListView()),
//                         );
//                       },
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/3595/3595455.png",
//                       "label": "Pizza",
//                       "onTap": () {},
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/2718/2718224.png",
//                       "label": "Noodles",
//                       "onTap": () {},
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/8060/8060549.png",
//                       "label": "Meat",
//                       "onTap": () {},
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/454/454570.png",
//                       "label": "Soup",
//                       "onTap": () {},
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/2965/2965567.png",
//                       "label": "Dessert",
//                       "onTap": () {},
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/2769/2769608.png",
//                       "label": "Drink",
//                       "onTap": () {},
//                     },
//                     {
//                       "icon":
//                           "https://cdn-icons-png.flaticon.com/128/1037/1037855.png",
//                       "label": "Others",
//                       "onTap": () {},
//                     },
//                   ];

//                   return Wrap(
//                     children: List.generate(
//                       menus.length,
//                       (index) {
//                         var item = menus[index];

//                         var size = constraint.biggest.width / 4;

//                         return SizedBox(
//                           width: size,
//                           height: size,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.blueGrey,
//                               animationDuration:
//                                   const Duration(milliseconds: 1000),
//                               backgroundColor: Colors.transparent,
//                               splashFactory: InkSplash.splashFactory,
//                               shadowColor: Colors.transparent,
//                               elevation: 0.0,
//                             ),
//                             onPressed: () => item["onTap"](),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.network(
//                                   item["icon"],
//                                   width: 30.0,
//                                 ),
//                                 const SizedBox(
//                                   height: 6.0,
//                                 ),
//                                 Text(
//                                   "${item["label"]}",
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     fontSize: 11.0,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   State<PosDashboardView> createState() => PosDashboardController();
// }
