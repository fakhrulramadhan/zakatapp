import 'package:flutter/material.dart';

class TemplateOrientationBuilderLayout extends StatelessWidget {
  const TemplateOrientationBuilderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#GROUP_TEMPLATE layout

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:
          //#TEMPLATE orientation_builder
          OrientationBuilder(
        builder: (context, orientation) {
          bool isPotrait = orientation == Orientation.portrait;
          bool isLandscape = orientation == Orientation.landscape;

          if (isPotrait) {
            //if potrait
            return SizedBox(
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100.0,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100.0,
                    color: Colors.purple,
                  ),
                ],
              ),
            );
          } else {
            //if landscape
            return SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 100.0,
                    color: Colors.red,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      //#END
    );
  }
}
