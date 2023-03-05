// import 'package:example/core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PosProfileController extends State<PosProfileView>
//     implements MvcController {
//   static late PosProfileController instance;
//   late PosProfileView view;

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//   }

//   @override
//   void dispose() => super.dispose();

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   void doLogOut() async {
//     //firelogout tab..
//     await FirebaseAuth.instance.signOut();

//     //kemudian arahkan ke  halaman poslogin
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const PosLoginView()),
//     );
//   }
// }
