import 'package:flutter/material.dart';

class ContainerTemplateView extends StatelessWidget {
  const ContainerTemplateView({Key? key}) : super(key: key);

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
            children: [
              //#GROUP_TEMPLATE container
              //#TEMPLATE contrad
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
              //#END
              //#TEMPLATE conimage
              Container(
                height: 100.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://i.ibb.co/3pPYd14/freeban.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
              //#END

              Container(
                //#TEMPLATE decoration
                decoration: const BoxDecoration(),
                //#END
              ),

              //----------------------------------------
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                    //#TEMPLATE border
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[900]!,
                    ),
                    //#END
                    //#TEMPLATE radius
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    //#END
                    //#TEMPLATE shadow
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 11),
                      ),
                    ],
                    //#END
                    //#TEMPLATE decoration_image
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://i.ibb.co/3pPYd14/freeban.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                    //#END
                    //#TEMPLATE gradient
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.red,
                      ],
                    )
                    //#END
                    ),
              ),
              //----------------------------------------
              //----------------------------------------
              //----------------------------------------
              //#TEMPLATE ch3
              Container(
                width: 100.0,
                color: Colors.red,
              ),
              Container(
                width: 100.0,
                color: Colors.red,
              ),
              Container(
                width: 100.0,
                color: Colors.red,
              ),
              //#END
              //#TEMPLATE cv3
              Container(
                height: 100.0,
                color: Colors.green,
              ),
              Container(
                height: 100.0,
                color: Colors.blue,
              ),
              Container(
                height: 100.0,
                color: Colors.purple,
              ),
              //#END
            ],
          ),
        ),
      ),
    );
  }
}
