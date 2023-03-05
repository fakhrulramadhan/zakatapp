import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/template_card_view.dart';

class TemplateCardController extends State<TemplateCardView>
    implements MvcController {
  static late TemplateCardController instance;
  late TemplateCardView view;

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
