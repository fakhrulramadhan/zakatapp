import 'package:flutter/material.dart';
import 'package:example/core.dart';

class ZakatDashboardView extends StatefulWidget {
  const ZakatDashboardView({Key? key}) : super(key: key);

  Widget build(context, ZakatDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ZakatDashboard"),
        actions: [
          IconButton(
              onPressed: () => controller.logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //banner_image_text
              Container(
                height: 160.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 0.0,
                      bottom: 0.0,
                      child: SizedBox(
                        width: 100.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "30%",
                              style: GoogleFonts.oswald(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Discount Only Valid for Today",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              //item_statistic_order tab
              // Card(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: const EdgeInsets.all(20.0),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               const Text(
              //                 "Jumlah Zakat Masuk",
              //                 style: TextStyle(
              //                   fontSize: 12.0,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 6.0,
              //               ),
              //               Row(
              //                 children: const [
              //                   Text(
              //                     "4,200",
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                   Text(
              //                     "+36%",
              //                     style: TextStyle(
              //                       fontSize: 10.0,
              //                       color: Colors.green,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           padding: const EdgeInsets.all(10.0),
              //           decoration: const BoxDecoration(
              //             color: Colors.red,
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(
              //                 8.0,
              //               ),
              //             ),
              //           ),
              //           child: const Icon(
              //             Icons.list,
              //             size: 24.0,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20.0,
              ),

              //menu_image tab
              LayoutBuilder(
                builder: (context, constraint) {
                  List menus = [
                    {
                      "icon":
                          "https://img.freepik.com/free-vector/box-with-money-charity-donation_24877-54483.jpg?w=360&t=st=1674222738~exp=1674223338~hmac=d3b6e7efdb6390319e0d3c16ca342bd0de2a90306b70ce070cbb621c5a0f5cb7",
                      "label": "ZFitrah",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ZakatFitrahView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/3595/3595455.png",
                      "label": "ZEmas",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ZakatEmasView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/2718/2718224.png",
                      "label": "ZNiaga",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ZakatPerniagaanView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/8060/8060549.png",
                      "label": "ZProfesi",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ZakatProfesiView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/454/454570.png",
                      "label": "List ZFitrah",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ListZakatFitrahView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/2965/2965567.png",
                      "label": "ListZEmas",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListZakatEmasView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/2769/2769608.png",
                      "label": "List ZNiaga",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ListZakatPerniagaanView()),
                        );
                      },
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/1037/1037855.png",
                      "label": "List ZProfesi",
                      "onTap": () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ListZakatProfesiView()),
                        );
                      },
                    },
                  ];

                  return Wrap(
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = constraint.biggest.width / 4;

                        return SizedBox(
                          width: size,
                          height: size,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blueGrey,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              backgroundColor: Colors.transparent,
                              splashFactory: InkSplash.splashFactory,
                              shadowColor: Colors.transparent,
                              elevation: 0.0,
                            ),
                            onPressed: () => item["onTap"](),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  item["icon"],
                                  width: 30.0,
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  "${item["label"]}",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ZakatDashboardView> createState() => ZakatDashboardController();
}
