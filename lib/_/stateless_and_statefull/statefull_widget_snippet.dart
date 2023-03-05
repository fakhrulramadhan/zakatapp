//#GROUP_TEMPLATE lifecycle
import 'package:flutter/material.dart';

class CURSOR_1 extends StatefulWidget {
  const CURSOR_1({Key? key}) : super(key: key);

  @override
  State<CURSOR_1> createState() => _CURSOR_1State();
}

class _CURSOR_1State extends State<CURSOR_1> {
  //#TEMPLATE lifecycle
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(_) {
    super.didUpdateWidget(_);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //#END
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [CURSOR_2],
          ),
        ),
      ),
    );
  }
}

var CURSOR_2;
