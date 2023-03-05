import 'package:flutter/material.dart';
import 'package:example/core.dart';
import 'package:lottie/lottie.dart';

class SecondScreenView extends StatefulWidget {
  const SecondScreenView({Key? key}) : super(key: key);

  Widget build(context, SecondScreenController controller) {
    controller.view = this;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Zakat App",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          actions: const [],
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Center(
                  //alignment: Alignment.center,
                  child: SizedBox(
                    height: 180,
                    width: 180,
                    child: Lottie.asset("assets/lottie/youngmuslims.json",
                        fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Fitur Fitur yang mumpuni",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Memudahkan Amil untuk manajemen data Zakat",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 160.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstScreenView(),
                          )),
                      child: const Text(
                        "Kembali",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ZakatLoginView(),
                          )),
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(fontSize: 13.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  State<SecondScreenView> createState() => SecondScreenController();
}
