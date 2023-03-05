import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class TemplateScaffoldOvo extends StatelessWidget {
  const TemplateScaffoldOvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //#GROUP_TEMPLATE scaffold
    //#TEMPLATE scaffold_ovo
    // ------------------------
    // [1] Update pubspec.yaml
    // flutter_custom_clippers:
    // ------------------------
    // [2] Import
    // import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
    // ------------------------
    // inspiration: OVO App
    // started by: Danu Septian
    // website: https://danuseptian.com/
    // ------------------------

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "OWO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 6.0,
                    bottom: 6.0,
                    left: 12.0,
                    right: 12.0,
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        "https://i.ibb.co/Kx4dGMD/1892602.png",
                        color: Colors.purple[900],
                        width: 14.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "Promo",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.purple[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250 + MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: SinCosineWaveClipper(),
                    child: Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: NetworkImage('https://capekngoding.com/uploads/62f5f123a60ae_15.png'),
                          image: NetworkImage(
                            "https://wallpaperaccess.com/full/1601031.jpg",
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.purple[900]!.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "OWO Cash",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            "5000 USD",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Points",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "4500",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[300],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(20.0),
                              child: Builder(builder: (context) {
                                var menus = [
                                  {
                                    "icon":
                                        "https://i.ibb.co/9VyBkjg/5894760.png",
                                    "label": "Topup",
                                  },
                                  {
                                    "icon":
                                        "https://i.ibb.co/rFLH1JF/2048743.png",
                                    "label": "Transfer",
                                  },
                                  {
                                    "icon":
                                        "https://i.ibb.co/KxJ01vc/892209.png",
                                    "label": "Withdraw",
                                  },
                                  {
                                    "icon":
                                        "https://i.ibb.co/L17PNDX/2901149.png",
                                    "label": "History",
                                  },
                                ];
                                return Row(
                                  children: List.generate(
                                    menus.length,
                                    (index) {
                                      var menu = menus[index];

                                      return Expanded(
                                        child: Column(
                                          children: [
                                            ImageIcon(
                                              NetworkImage(
                                                "${menu["icon"]}",
                                              ),
                                              color: Colors.purple[900],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${menu["label"]}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //#END
  }
}
