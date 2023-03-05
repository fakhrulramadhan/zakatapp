import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/zakat_maal_controller.dart';

class ZakatMaalView extends StatefulWidget {
  const ZakatMaalView({Key? key}) : super(key: key);

  Widget build(context, ZakatMaalController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ZakatMaal"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ZakatMaalView> createState() => ZakatMaalController();
}