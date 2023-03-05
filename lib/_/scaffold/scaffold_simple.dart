import 'package:flutter/material.dart';

class TemplateScaffoldSimple extends StatelessWidget {
  const TemplateScaffoldSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#GROUP_TEMPLATE scaffold
    //#TEMPLATE scaffold_simple
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
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
    //#END
  }
}
