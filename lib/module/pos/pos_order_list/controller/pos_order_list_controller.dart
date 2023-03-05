import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/pos_order_list_view.dart';

class PosOrderListController extends State<PosOrderListView> implements MvcController {
  static late PosOrderListController instance;
  late PosOrderListView view;

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