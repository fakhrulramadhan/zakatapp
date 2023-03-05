// //nav_float tab
// import 'package:example/core.dart';
// import 'package:flutter/material.dart';

// class PosMainNavigationView extends StatefulWidget {
//   const PosMainNavigationView({Key? key}) : super(key: key);

//   @override
//   State<PosMainNavigationView> createState() => _PosMainNavigationViewState();
// }

// class _PosMainNavigationViewState extends State<PosMainNavigationView> {
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       initialIndex: selectedIndex,
//       child: Scaffold(
//         extendBody: true,
//         body: IndexedStack(
//           index: selectedIndex,
//           children: [
//             const PosDashboardView(),
//             const PosOrderListView(),
//             Container(
//               color: Colors.purple[100],
//             ),
//             const PosProfileView(),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.blueGrey,
//           onPressed: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(builder: (context) => const PosView()),
//             // );
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const PosTableView()),
//             );
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(
//                 Icons.point_of_sale,
//                 color: Colors.white,
//               ),
//               SizedBox(
//                 height: 2.0,
//               ),
//               Text(
//                 'POS',
//                 style: TextStyle(
//                   fontSize: 9.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           color: Colors.blueGrey,
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 5,
//           child: SizedBox(
//             height: 60.0,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 20.0,
//                 right: 20.0,
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Expanded(
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.home,
//                         color: selectedIndex == 0
//                             ? Colors.white
//                             : Colors.blueGrey[600],
//                       ),
//                       onPressed: () {
//                         selectedIndex = 0;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.list,
//                         color: selectedIndex == 1
//                             ? Colors.white
//                             : Colors.blueGrey[600],
//                       ),
//                       onPressed: () {
//                         selectedIndex = 1;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20.0,
//                   ),
//                   Expanded(
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.favorite,
//                         color: selectedIndex == 2
//                             ? Colors.white
//                             : Colors.blueGrey[600],
//                       ),
//                       onPressed: () {
//                         selectedIndex = 2;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.person,
//                         color: selectedIndex == 3
//                             ? Colors.white
//                             : Colors.blueGrey[600],
//                       ),
//                       onPressed: () {
//                         selectedIndex = 3;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
