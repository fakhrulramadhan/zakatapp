import 'package:example/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:example/core.dart';

//Nishab zakat penghasilan sebesar 85 gram emas per tahun.
//1 gram emas per hari ini 18 01 2023 Rp.965.000
// 965.000 x 85 gram = Rp.82.000.000 (per tahun)

//nishab (82 juta) /12  =  RP.6.834.000 (nishab gaji per bulan di atas 6,8 jt)
// berarti zakat profesi per bulannya minimal 171 rb
//2,5% x 6.834.000 = 171.000

// Gaji per tahun kalau mau zakat profeesi yaitu sbesar RP.82.000.000
// berarti zakat profesi per tahunnya minimal Rp.2.050.000
// 2,5% x RP.82.000.000 = Rp.2.050.000

// Ketentuannya adalah, zakat profesi 2,5% x Jumlah penghasilan dalam 1 bulan.
//Atau 2.5% x jumlah penghasilan selama setahun

class ZakatProfesiView extends StatefulWidget {
  const ZakatProfesiView({Key? key}) : super(key: key);

  Widget build(context, ZakatProfesiController controller) {
    controller.view = this;

    final zprofesiform = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zakat Profesi"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
                width: 300,
                // \n = enter
                child: Text(
                  '''Ketentuan Nishab Zakat Profesi yaitu 85 gram emas. \n  \n 1 gram emas = Rp.965.000 Berarti Nishabnya Rp.965.000 * 85 = Rp.82.000.000  \n \n Minimal Gaji Bulanan anda untuk mencapai nishab (ketentuan) \n yaitu RP.6.834.000 ''',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  //maxLines: 5, //jml max baris
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                  key: zprofesiform,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          //initialValue: 'John Doe',
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
                            helperText: "Isi Nama Lengkap",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Wajib Diisi";
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
                          controller: controller.gajiperbulanC,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText: 'Nominal Kisaran Gaji Anda Per Bulan',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Nominal Range Gaji Per Bulan",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                controller.gajiperTahunC.text.isNotEmpty) {
                              return "Cukup isi salah satunya saja \n jumlah Gaji Per Bulan atau jumlah Gaji Per Tahun";
                            } else if (value.isEmpty &&
                                controller.gajiperTahunC.text.isNotEmpty) {
                              return null;
                            } else if (value.isEmpty) {
                              return null;
                            } //salah disini, seharusnya parse double
                            else if (StringExtensions(value).parseInt() <=
                                    6833900 &&
                                controller.gajiperTahunC.text.isEmpty) {
                              return "Mohon maaf, anda belum mencapai nishab \nuntuk zakat Profesi Min Gaji \nBulanan anda yaitu Rp.6.834.000";
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
                          controller: controller.gajiperTahunC,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            labelText: 'Nominal Kisaran Gaji Anda Per Tahun',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Nominal Kisaran Gaji Anda Per Tahun",
                          ),
                          onChanged: (value) {},

                          validator: (value) {
                            if (controller.gajiperbulanC.text.isNotEmpty &&
                                value!.isNotEmpty) {
                              return "Cukup isi salah satunya saja \n jumlah Gaji Per Bulan atau jumlah Gaji Per Tahun";
                            } else if (controller
                                    .gajiperTahunC.text.isNotEmpty &&
                                value == null) {
                              //value jml perak
                              return null;
                            } else if (value == null || value.isEmpty) {
                              return null;
                              //salah disini
                            } else if (StringExtensions(value).parseInt() <
                                    81999999 &&
                                controller.gajiperbulanC.text.isEmpty) {
                              return "Mohon maaf, anda belum mencapai nishab \nuntuk zakat Profesi Min Gaji \nBulanan anda yaitu Rp.82.000.000";
                            }

                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          initialValue: "${controller.zperbulan}",
                          maxLength: 20,
                          //controller: controller.zperbulanC,
                          decoration: const InputDecoration(
                            labelText: 'Zakat  Per Bulan',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Zakat  Per Bulan",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            //jika data gaji per bulan dan per tahun terisi
                            //kalau pakai  if (value != null &&
                            //controller.zpertahunC.text.isNotEmpty) g nangkap
                            if (value!.isEmpty ||
                                value == 0 && controller.zpertahun == 0) {
                              return "Cukup isi salah satu saja \n(Zakat per bulan / Per Tahun)";
                            } else if (value.isEmpty) {
                              return null;
                            } else if (StringExtensions(value).parseDouble() <=
                                    170999 &&
                                controller.zpertahun == 0) {
                              return '''Zakat Per Bulan anda minimmal \n harus RP.171.000 \n agar bisa mencapai nishab 90 gram emas \n per bulannya (2,5%) yakni minimal sebesar \n Rp.171.000 ''';
                            }

                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          initialValue: "${controller.zpertahun}",
                          maxLength: 20,
                          //controller: controller.zpertahunC,
                          decoration: const InputDecoration(
                            labelText: 'Zakat Per Tahun',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Zakat Per Tahun",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            // \n = enter

                            //kalau datanya kosong tapi yang sebelumnya sudah diisi
                            //maka enggak ada validasi
                            if (value!.isEmpty ||
                                value == 0 && controller.zperbulan == 0) {
                              return "Cukup isi salah satu saja \n(Zakat per bulan / Per Tahun)";
                            } else if (value.isEmpty) {
                              return null;
                            } else if (StringExtensions(value).parseDouble() <=
                                    2049999 &&
                                controller.zperbulan == 0) {
                              return '''Zakat Per Tahun anda minimmal \n harus RP.2.050.000 \n agar bisa mencapai nishab 90 gram emas \n per bulannya (2,5%) yakni minimal sebesar \n Rp.171.000 ''';
                              //return null;
                            }

                            return null;
                          },
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (controller.gajiperbulanC.text.isNotEmpty) {
                            controller.zakatbulanan();
                            //pengganti setstate
                            controller.update();
                          }
                        },
                        icon: const Icon(
                          Icons.calculate_sharp,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Hitung Nishab Zakat Bulanan",
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
                          if (controller.gajiperTahunC.text.isNotEmpty) {
                            controller.zakattahunan();
                            //pengganti setstate
                            controller.update();
                          }
                        },
                        icon: const Icon(
                          Icons.calculate,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Hitung Nishab Zakat Tahunan",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (controller.zperbulan != 0) {
                            controller.resetnishabbulanan();
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
                          if (controller.zpertahun != 0) {
                            controller.resetnishabtahunan();
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
                          if (zprofesiform.currentState!.validate()) {
                            controller.simpanzprofesi();
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
  State<ZakatProfesiView> createState() => ZakatProfesiController();
}
