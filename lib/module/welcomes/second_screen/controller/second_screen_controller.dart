import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/second_screen_view.dart';

class SecondScreenController extends State<SecondScreenView> implements MvcController {
  static late SecondScreenController instance;
  late SecondScreenView view;

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