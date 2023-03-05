import 'package:flutter/material.dart';
import 'package:example/core.dart';
import 'package:lottie/lottie.dart';

class FirstScreenView extends StatefulWidget {
  const FirstScreenView({Key? key}) : super(key: key);

  Widget build(context, FirstScreenController controller) {
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
        body: ListView(
          scrollDirection: Axis.vertical,
          //padding: const EdgeInsets.all(20),
          children: [
            SizedBox(
              //jangan pakai ini karenanakan scroll terus
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Lottie.asset("assets/lottie/muslimgives.json",
                          fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Aplikasi Manajemen Zakat",
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
                      "Sebagai Solusi Pengelolaan Dana Zakat Anda",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 170.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SecondScreenView(),
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
          ],
        ));
  }

  @override
  State<FirstScreenView> createState() => FirstScreenController();
}
