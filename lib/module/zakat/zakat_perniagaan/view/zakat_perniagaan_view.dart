import 'package:flutter/material.dart';
import 'package:example/core.dart';

//zakat dagang minimal Rp.2.050.000

class ZakatPerniagaanView extends StatefulWidget {
  const ZakatPerniagaanView({Key? key}) : super(key: key);

  Widget build(context, ZakatPerniagaanController controller) {
    controller.view = this;

    final zperdaganganForm = GlobalKey<FormState>();
    double nishab;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ZakatPerniagaan"),
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
                  '''Ketentuan Nishab Zakat Perdagangan yaitu 85 gram emas. \n  \n 1 gram emas = Rp.965.000 Berarti Nishabnya Rp.965.000 * 85 = Rp.82.000.000  \n \n Minimal Aset Perdagangan anda untuk mencapai nishab (ketentuan) \n yaitu RP.82.000.000  ''',
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
                  key: zperdaganganForm,
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
                          maxLength: 20,
                          controller: controller.asetlaC,
                          decoration: const InputDecoration(
                            labelText: 'Aset Lancar',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Total Jumlah Aset Lancar",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            //jika data gaji per bulan dan per tahun terisi
                            //kalau pakai  if (value != null &&
                            //controller.zpertahunC.text.isNotEmpty) g nangkap
                            // if (controller.zperbulanC.text.isNotEmpty &&
                            //     controller.zpertahunC.text.isNotEmpty) {
                            //   return "Cukup isi salah satu saja \n(Zakat per bulan / Per Tahun)";
                            // } else if (value == null || value.isEmpty) {
                            //   return null;
                            // } else if (StringExtensions(value).parseInt() <
                            //     171000) {
                            //   return '''Zakat Per Bulan anda minimmal \n harus RP.171.000 \n agar bisa mencapai nishab 90 gram emas \n per bulannya (2,5%) yakni minimal sebesar \n Rp.171.000 ''';
                            // }

                            if (value == null || value.isEmpty) {
                              return "Jumlah Harta Aset Lancar Belum Diisi";
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
                          maxLength: 20,
                          controller: controller.hutangjapeC,
                          decoration: const InputDecoration(
                            labelText: 'Total Hutang Jangka Pendeks',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Total Hutang Jangka Pendek",
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            // \n = enter

                            if (value == null || value.isEmpty) {
                              return "Total Hutang Jangka Pendek Belum Diisi";
                            }

                            //kalau datanya kosong tapi yang sebelumnya sudah diisi
                            //maka enggak ada validasi
                            // if (controller.zperbulanC.text.isNotEmpty &&
                            //     controller.zpertahunC.text.isNotEmpty) {
                            //   return "Cukup isi salah satu saja \n (Zakat Per bulan / tahun)";
                            // } else if (controller.zperbulanC.text.isNotEmpty &&
                            //     value == null) {
                            //   return null;
                            // } else if (value == null || value.isEmpty) {
                            //   return null;
                            // } else if (StringExtensions(value).parseInt() <
                            //     2050000) {
                            //   return '''Zakat Per Tahun anda minimmal \n harus RP.2.050.000 \n agar bisa mencapai nishab 90 gram emas \n per tahun (2,5%) \n didapat dari RP 82.000.000 x 12 *2,5% ''';
                            // }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(),
                        child: TextFormField(
                          //agar datanya bisa dinamis
                          initialValue: '${controller.nishab}',
                          maxLength: 20,
                          //controller: controller.nishabC,
                          decoration: const InputDecoration(
                            labelText: 'Total Zakat perniagaan sesuai nishab',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            helperText: "Isi Zakat  Perniagaan",
                          ),
                          onChanged: (value) {
                            //value = controller.nishab as String;
                            //fungsi perhitungan jangan pasang di onchanged

                            //tapi bikin fungsi lagi di controller
                            // nishab = (StringExtensions(controller.asetlaC.text)
                            //             .parseDouble() -
                            //         StringExtensions(
                            //                 controller.hutangjapeC.text)
                            //             .parseDouble()) *
                            //     0.025;

                            // value = nishab.toString();

                            // controller.update();

                            //return value;
                          },
                          validator: (value) {
                            //jika data gaji per bulan dan per tahun terisi
                            //kalau pakai  if (value != null &&
                            //controller.zpertahunC.text.isNotEmpty) g nangkap
                            if (value == null || value.isEmpty) {
                              return "Tot Zakat Perniagaan Wajib diisi";
                            } else if (controller.nishab < 2050000) {
                              return '''Total Zakat Perniagaan anda minimal \n harus RP.2.050.000 \n agar bisa mencapai nishab 90 gram emas \n  ''';
                            }

                            return null;
                          },
                        ),
                      ),
                      //ambil data dari controller.nishab
                      //buat mendapatkan hasil perhitunganya
                      // Text(
                      //   "${controller.nishab}",
                      //   style: const TextStyle(
                      //     fontSize: 20.0,
                      //   ),
                      // ),
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.hitungnishab();

                          controller.update(); //pengganti setstate
                        },
                        icon: const Icon(
                          Icons.calculate,
                          size: 24.0,
                        ),
                        label: const Text(
                          "Hitung Nishab",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
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
                          if (zperdaganganForm.currentState!.validate()) {
                            controller.simpanzperniagaan();
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
  State<ZakatPerniagaanView> createState() => ZakatPerniagaanController();
}
