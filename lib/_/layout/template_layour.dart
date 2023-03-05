import 'package:flutter/material.dart';

class TemplateLayout extends StatelessWidget {
  const TemplateLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var CURSOR_1 = Container();
    //#GROUP_TEMPLATE layout

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //#TEMPLATE row
              Row(
                children: [CURSOR_1],
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE row2
              SizedBox(
                height: 100.0,
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE row3
              SizedBox(
                height: 100.0,
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE rowe2
              SizedBox(
                height: 100.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE rowe3
              SizedBox(
                height: 100.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE col
              Column(
                children: [CURSOR_1],
              ),
              //#END
              //#TEMPLATE col2
              Column(
                children: [
                  Container(
                    height: 100.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100.0,
                    color: Colors.blue,
                  ),
                ],
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE col3
              Column(
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
              //#END
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 300.0,
                child: //#TEMPLATE cole2
                    Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                //#END,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 300.0,
                child: //#TEMPLATE cole3
                    Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                //#END,
              ),
              const SizedBox(
                height: 20.0,
              ),

              //#TEMPLATE grid
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.red[100],
                    child: Column(
                      children: const [],
                    ),
                  );
                },
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),

              SizedBox(
                height: 100.0,
                child:
                    //#TEMPLATE streambuilder
                    StreamBuilder(
                  stream: null,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container();
                  },
                ),
                //#END
              ),
            ],
          ),
        ),
      ),
    );
  }
}
