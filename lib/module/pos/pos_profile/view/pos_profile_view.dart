// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:example/core.dart';
// import '../controller/pos_profile_controller.dart';

// class PosProfileView extends StatefulWidget {
//   const PosProfileView({Key? key}) : super(key: key);

//   Widget build(context, PosProfileController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PosProfile"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.logout),
//               label: const Text("Logout"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueGrey,
//               ),
//               onPressed: () {
//                 controller.doLogOut();
//               },
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Card(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   ElevatedButton.icon(
//                     icon: const Icon(Icons.reset_tv),
//                     label: const Text("Reset Data"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey,
//                     ),
//                     onPressed: () async {
//                       var snapshot = await FirebaseFirestore.instance
//                           .collection("pos_orders")
//                           .get();
//                       for (var i = 0; i < snapshot.docs.length; i++) {
//                         await FirebaseFirestore.instance
//                             .collection("pos_orders")
//                             .doc(snapshot.docs[i].id)
//                             .delete();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   State<PosProfileView> createState() => PosProfileController();
// }
