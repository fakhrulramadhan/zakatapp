import 'package:dio/dio.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CounterAppView extends StatefulWidget {
  const CounterAppView({Key? key}) : super(key: key);

  @override
  State<CounterAppView> createState() => _CounterAppViewState();
}

/*
MVC
  Model , View, Controller
MVP
MVVM
BLoC Architecture
Riverpod Architecture
Clean Architecture
*/
class _CounterAppViewState extends State<CounterAppView> {
  // CONTROLLER
  // CounterController
  int counter = 0;
  List userList = [];

  updateCounter() {
    counter++;
    setState(() {});
  }

  getUserList() async {
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    userList = obj["data"];
    setState(() {});
  }
  //END of Controller

  //VIEW
  //CounterVIew
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () => updateCounter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //VIEW
}
