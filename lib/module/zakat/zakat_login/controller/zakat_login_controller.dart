import 'package:example/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ZakatLoginController extends State<ZakatLoginView>
    implements MvcController {
  static late ZakatLoginController instance;
  late ZakatLoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  loginanonymous() async {
    await FirebaseAuth.instance.signInAnonymously();

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ZakatDashboardView()),
    // );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ZakatNavbarDashboardView()),
    );
  }

  void doGoogleLogin() async {
    //firegooglelogin tab
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: $userCredential");
      //TODO: on login success
      //------------------
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ZakatDashboardView()),
      // );

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ZakatNavbarDashboardView()),
      );
    } catch (_) {}
  }
}
