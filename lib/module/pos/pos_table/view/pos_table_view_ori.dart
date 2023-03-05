// import 'package:flutter/material.dart';
// import 'package:example/core.dart';

// class PosTableView extends StatefulWidget {
//   const PosTableView({Key? key}) : super(key: key);

//   Widget build(context, PosTableController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PosTable"),
//         actions: [
//           ElevatedButton.icon(
//             icon: const Icon(Icons.next_plan),
//             label: const Text("Next"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blueGrey,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const PosView()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   LayoutBuilder(
//                     builder: (context, constraint) {
//                       return Wrap(
//                         runSpacing: 10,
//                         spacing: 10,
//                         children:
//                             List.generate(controller.tables.length, (index) {
//                           //menampilkan masing2 nomor meja var tables (index)
//                           var item = controller.tables[index];
//                           //var booked = controller.Tableblocked[index];
//                           //mengambil ukuran lebar layar
//                           var size = (constraint.biggest.width - (10 * 4)) / 4;

//                           //kalau selectedTable == item berati tidak bisah dipilih
//                           bool isSelected = controller.selectedTable == item;
//                           return InkWell(
//                             onTap: () {
//                               controller.selectedTable = item;
//                               controller.update();
//                             },
//                             child: Container(
//                               height: size,
//                               width: size,
//                               decoration: BoxDecoration(
//                                   color: isSelected ? Colors.teal : Colors.grey,
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(17))),
//                               child: Center(
//                                 child: Text(
//                                   "$item",
//                                   style: const TextStyle(
//                                     fontSize: 21.0,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       );
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
//   State<PosTableView> createState() => PosTableController();
// }
