// import 'package:flutter/material.dart';
// import 'package:example/core.dart';

// class PosProductFormView extends StatefulWidget {
//   const PosProductFormView({Key? key}) : super(key: key);

//   Widget build(context, PosProductFormController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PosProductForm"),
//         actions: [
//           ElevatedButton.icon(
//             icon: const Icon(Icons.save),
//             label: const Text("Simpan"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blueGrey,
//             ),
//             onPressed: () {
//               controller.doSave();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           //pakai card agar backgroundnya warna putih
//           child: Card(
//             child: Column(
//               children: const [
//                 //f_image tab
//                 ExImagePicker(
//                   id: "photo",
//                   label: "Photo",
//                   // value: "https://i.ibb.co/PGv8ZzG/me.jpg",
//                 ),
//                 //f_text tab
//                 ExTextField(
//                   id: "product_name",
//                   label: "Product Name",
//                   value: " - ",
//                 ),
//                 ExTextField(
//                   id: "price",
//                   label: "Price",
//                   value: "0",
//                 ),
//                 ExCombo(
//                   id: "category",
//                   label: "Category",
//                   items: [
//                     {
//                       "label": "food",
//                       "value": "Food",
//                     },
//                     {
//                       "label": "Drink",
//                       "value": "drink",
//                     },
//                     {
//                       "label": "Cake",
//                       "value": "cake",
//                     }
//                   ],
//                   value: "Food",
//                 ), //f_combo tab
//                 ExTextArea(
//                   id: "description",
//                   label: "Description",
//                   value: null,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   State<PosProductFormView> createState() => PosProductFormController();
// }
