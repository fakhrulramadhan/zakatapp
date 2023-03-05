// import 'package:example/firebase_options.dart';
import 'package:flutter/material.dart';

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb && !Platform.isWindows) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }
}
