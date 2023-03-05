import 'package:example/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:example/core.dart';

//Zakat Emas
//Jika perhiasan tersebut sebagai simpanan atau investasi, wajib dikeluarkan zakatnya 2.5% dengan syarat nishob dan haul.
// Penentuan nishabnya adalah senilai dengan nishab emas 85 gram.
//Nishab emas 20 dinar, 1 dinar = 4,25 gram, maka nishab emas adalah 20 X 4,25 gram = 85 gram.
//2,5% nya yaitu 2,125 gram

//Zakat Perak
//Nishab Perak adalah 200 dirham, 1 dirham = 2,975 gram, maka nishab perak adalah 200 X 2,975 gram = 595 gram.

class ZakatEmasView extends StatefulWidget {
  const ZakatEmasView({Key? key}) : super(key: key);

  Widget build(context, ZakatEmasController controller) {
    controller.view = this;

    final zEmasPerakform = GlobalKey<FormState>();

    //double nishab

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zakat Emas"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 175,
                width: 300,
                child: Text(
                  "Ketentuan Nishab Zakat Emas yakni 85 gram emas  \n(Zakat nya minimal 2,15 gram emas)\n Nishab Zakat Perak yakni 595 gram perak \n (Zakatnya minimal 15 gram perak) \n Zakatnya harus berupa harta (Emas / perak)",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                  key: zEmasPerakform,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          // initialValue: 'John Doe',
                          maxLength: 20,
                          controller: controller.namaC,
                          decoration: const InputDecoration(
                            labelText: 'Nama Muzakki',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Nama Anda",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Waib diisi";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          //initialValue: 'John Doe',
                          controller: controller.jmlemasC,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText:
                                'Jml Berat Emas yang dimiliki (dalam gr)',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Total Emas yang dimiliki",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                controller.jmlperakC.text.isNotEmpty) {
                              return "Cukup isi salah satunya saja \n jumlah emas atau jumlah perak";
                            } else if (value.isEmpty &&
                                controller.jmlperakC.text.isNotEmpty) {
                              return null;
                            } else if (value.isEmpty) {
                              return null;
                            } else if (StringExtensions(value).parseInt() <
                                    85 &&
                                controller.zakatperakC.text.isEmpty) {
                              return "Mohon maaf, anda belum mencapai nishab untuk zakat Emas";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          //initialValue: 'John Doe',
                          controller: controller.jmlperakC,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText:
                                'Jml Berat Perak yang dimiliki (dalam gr)',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Masukkan Jumlah Perak",
                          ),
                          onChanged: (value) {},

                          validator: (value) {
                            if (controller.jmlemasC.text.isNotEmpty &&
                                value!.isNotEmpty) {
                              return "Cukup isi salah satunya aja \n jumlah emas atau jumlah perak";
                            } else if (controller.jmlemasC.text.isNotEmpty &&
                                value == null) {
                              //value jml perak
                              return null;
                            } else if (value == null || value.isEmpty) {
                              return null;
                            } else if (StringExtensions(value).parseInt() <
                                    515 &&
                                controller.jmlemasC.text.isEmpty) {
                              return "Mohon maaf, anda belum mencapai nishab untuk zakat Emas";
                            }

                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          initialValue: '${controller.nishabEmas}',
                          //controller: controller.zakatemasC,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah Zakat Emas (dalam gram)',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Jumlah Zakat Emas",
                          ),
                          onChanged: (value) {
                            value = controller.nishabEmas.toString();
                          },
                          //sebutin value emasnya dulu, baru sebutin
                          //value peraknya
                          //value nya menjadi value emas
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value == 0 && controller.nishabPerak != 0) {
                              return "Salah satu data aja yang wajib diisi";
                            } else if (value.isEmpty &&
                                controller.nishabPerak == 0) {
                              return "Wajib ada yang diisi salah satunya";
                            } else if (value.isEmpty &&
                                controller.nishabPerak != 0) {
                              return null;
                            } else if (controller.nishabEmas <= 2.124 &&
                                controller.nishabPerak == 0) {
                              return '''Total Zakat Emas anda \n minimal harus sebesar 2,125 gram emas''';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          initialValue: '${controller.nishabPerak}',
                          //controller: controller.zakatperakC,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah Zakat Perak (dalam gram)',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Jumlah Zakat Perak",
                          ),
                          onChanged: (value) {
                            //value = controller.nishabPerak.toString();
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty && controller.nishabEmas != 0) {
                              return "Salah satu data aja yang diisi";
                            } else if (value.isEmpty &&
                                controller.nishabEmas == 0) {
                              return "Wajib ada yang diisi salah satunya";
                            } else if (value.isEmpty &&
                                controller.nishabEmas != 0) {
                              return null;
                            } else if (controller.nishabPerak <= 2.124 &&
                                controller.nishabEmas == 0) {
                              return '''Total Zakat Perak anda \n minimal harus sebesar 15 gram emas''';
                            }
                            return null;
                          },
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (controller.jmlemasC.text.isNotEmpty) {
                            controller.hitungnishabEmas();
                            //pengganti setstate
                            controller.update();
                          }
                        },
                        icon: const Icon(
                          Icons.calculate_sharp,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Hitung Nishab Emas",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (controller.jmlperakC.text.isNotEmpty) {
                            controller.hitungnishabPerak();
                            //pengganti setstate
                            controller.update();
                          }
                        },
                        icon: const Icon(
                          Icons.calculate,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Hitung Nishab Perak",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (controller.nishabEmas != 0) {
                            controller.resetnishabEmas();
                            //pengganti setstate
                            controller.update();
                          }
                        },
                        icon: const Icon(
                          Icons.calculate,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Reset Nishab Emas",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (controller.nishabPerak != 0) {
                            controller.resetnishabPerak();
                            //pengganti setstate
                            controller.update();
                          }
                        },
                        icon: const Icon(
                          Icons.calculate,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Reset Nishab Perak",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      const ExCombo(
                        id: "metode",
                        label: "Metode Zakat",
                        items: [
                          {"label": "Tunai", "value": "Tunai"},
                          {"label": "OVO", "value": "OVO"},
                          {"label": "QRIS", "value": "QRIS"},
                          {"label": "Dana", "value": "Dana"},
                          {"label": "Shopee Pay", "value": "Shopee Pay"},
                        ],
                        value: "Tunai",
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          //controller.simpanzemasperak();
                          if (zEmasPerakform.currentState!.validate()) {
                            controller.simpanzemasperak();
                          }
                        },
                        icon: const Icon(
                          Icons.save,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ZakatEmasView> createState() => ZakatEmasController();
}
