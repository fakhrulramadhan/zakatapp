// import 'package:example/core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class PosLoginController extends State<PosLoginView> implements MvcController {
//   static late PosLoginController instance;
//   late PosLoginView view;

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//   }

//   @override
//   void dispose() => super.dispose();

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   doGuestLogin() async {
//     //fireloginanonymous tab..

//     await FirebaseAuth.instance.signInAnonymously();

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const PosMainNavigationView()),
//     );
//   }

//   void doGoogleLogin() async {
//     //firelogin tab...
//     GoogleSignIn googleSignIn = GoogleSignIn(
//       scopes: [
//         'email',
//       ],
//     );

//     try {
//       await googleSignIn.disconnect();
//     } catch (_) {}

//     try {
//       GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       var userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       debugPrint("userCredential: $userCredential");
//       //TODO: on login success
//       //------------------
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const PosMainNavigationView()),
//       );
//     } catch (_) {}
//   }
// }
