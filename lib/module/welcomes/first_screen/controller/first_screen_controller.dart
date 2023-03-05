import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/first_screen_view.dart';

class FirstScreenController extends State<FirstScreenView> implements MvcController {
  static late FirstScreenController instance;
  late FirstScreenView view;

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