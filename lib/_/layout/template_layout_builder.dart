import 'package:flutter/material.dart';

class TemplateLayoutBuilder extends StatelessWidget {
  const TemplateLayoutBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#GROUP_TEMPLATE layout

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:
          //#TEMPLATE layout_builder
          LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isTablet = MediaQuery.of(context).size.width < 1100 &&
              MediaQuery.of(context).size.width >= 850;
          bool isDesktop = MediaQuery.of(context).size.width >= 1100;
          bool isMobile = MediaQuery.of(context).size.width < 850;

          if (isDesktop) {
            return Container(
              color: Colors.red[100],
            );
          }

          if (isTablet) {
            return Container(
              color: Colors.green[100],
            );
          }

          //mobile
          return Container(
            color: Colors.blue[100],
          );
        },
      ),
      //#END
    );
  }
}
