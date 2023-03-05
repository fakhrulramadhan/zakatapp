import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/zakat_maal_view.dart';

class ZakatMaalController extends State<ZakatMaalView> implements MvcController {
  static late ZakatMaalController instance;
  late ZakatMaalView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}