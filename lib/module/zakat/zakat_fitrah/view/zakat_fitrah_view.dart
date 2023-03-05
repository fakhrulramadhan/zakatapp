import 'package:flutter/material.dart';
import 'package:example/core.dart';
import 'package:example/string_ext.dart';

class ZakatFitrahView extends StatefulWidget {
  const ZakatFitrahView({Key? key}) : super(key: key);

  Widget build(context, ZakatFitrahController controller) {
    controller.view = this;

    // TextEditingController namaC = TextEditingController();
    // TextEditingController nominalC = TextEditingController();
    //Int nominal;

    final zfitrahformkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zakat Fitrah"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                  key: zfitrahformkey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Muzakki Wajib diisi";
                            }
                            return null;
                          },
                          //diambil dari nama texteditingcontroller
                          //di controller
                          controller: controller.namaC,
                          //initialValue: '', //inisial valuenya hapus
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Nama Muzakki",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          //initialValue: '',
                          controller: controller.nominalC,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nominal Wajib Diisi";
                            } else if (StringExtensions(value).parseInt() <
                                30000) {
                              return "Min Nominal Zakat Rp.30.000";
                            }

                            //int try parse utk konvert value yang
                            //tipenya string menjai integer,
                            // if (int.tryParse(value)! < 30000) {
                            //   //dibawah 30rb, tdk bisa zakat fitrah
                            //   return "Minimal Harus Rp.30000";
                            // }
                            return null;
                          },
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText: 'Nominal',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "What's your name?",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      //excombo tab /  option
                      const ExCombo(
                        id: "metode",
                        label: "Metode Zakat",
                        items: [
                          {"label": "Tunai", "value": "Tunai"},
                          {"label": "OVO", "value": "OVO"},
                          {"label": "QRIS", "value": "QRIS"},
                          {"label": "Dana", "value": "Dana"},
                          {"label": "Shopee Pay", "value": "Shopee Pay"},
                          {
                            "label": "Barang (Beras)",
                            "value": "Barang (Beras)"
                          },
                        ],
                        value: "Tunai",
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        onPressed: () {
                          //jika form sudah keisi semua,  baru simpan data
                          if (zfitrahformkey.currentState!.validate()) {
                            controller.simpanzfitrah();
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(const SnackBar(
                            //   content: Text("Data terisi Semua"),
                            // ));
                          }
                          // controller.simpanzfitrah();
                        },
                        icon: const Icon(
                          Icons.save,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white, fontSize: 14),
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
  State<ZakatFitrahView> createState() => ZakatFitrahController();
}
