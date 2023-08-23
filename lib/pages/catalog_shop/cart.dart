import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/Mini_map.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool allCheckbox = false;
  List<bool> CheckBoxList = [
    for (var i = 0; i <= 3; i++) false,
  ];

  bool? isChecked = false;

  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FA),
      appBar: AppBar(
        title: const Text(
          "Keranjang",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: const Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const KatalogShop(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Text(
              'Pesanan Anda',
              style: TextStyle(
                color: Color(0xFFADADAD),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 7,
            ),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    value: allCheckbox,
                    onChanged: (value) {
                      setState(() {
                        allCheckbox = value!;
                        for (var i = 0; i < 3; i++) CheckBoxList[i] = value;
                      });
                    },
                    activeColor: const Color(0xFF94AF9F),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Pilih Semua',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 3,
            color: Color(0xFFEBEBEB),
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 7,
                  top: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1,
                      child: Checkbox(
                        value: CheckBoxList[index],
                        onChanged: (val) {
                          print('asw');
                          allCheckbox =
                              CheckBoxList.every((value) => value == true);

                          setState(() {
                            CheckBoxList[index] = val!;
                            if (val == false) {
                              allCheckbox = false;
                            } else if (CheckBoxList.every(
                                ((value) => value == true))) {
                              allCheckbox = false;
                            }
                            ;
                          });
                        },
                        activeColor: const Color(0xFF94AF9F),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 65,
                      height: 107,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 9,
                          top: 9,
                          bottom: 9,
                          right: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image: AssetImage(
                                    "assets/img/produk-philodendron.png"),
                                width: 88,
                                height: 89,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 168,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tanaman',
                                          style: TextStyle(
                                            color: Color(0xFFADADAD),
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 160,
                                    child: const Text(
                                      'Tanaman Philodendron\nMonstera Deliciosa',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 169,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                decrement();
                                              },
                                              child: const Icon(
                                                Icons.remove_circle_outline,
                                                size: 17,
                                                color: Color(0xFF94AF9F),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                '$quantity',
                                                style: const TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                decrement();
                                              },
                                              child: const Icon(
                                                Icons.add_circle_outline,
                                                size: 17,
                                                color: Color(0xFF94AF9F),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "Rp150.000",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 159,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pesanan Anda',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pengiriman',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Rp3.000",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Rp150.000",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MiniMap()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: const Color(0xffa3bfae),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   onAllClicked(checkboxModal ckbItem) {
//     final newValue = !ckbItem.value;
//     setState(() {
//       ckbItem.value = newValue;
//       CheckBoxList.forEach((element) {
//         element.value = newValue;
//       });
//     });
//   }

//   onItemClicked(checkboxModal ckbItem) {
//     final newValue = !ckbItem.value;
//     setState(() {
//       ckbItem.value = newValue;

//       if (!newValue) {
//         AllChecked.value = false;
//       } else {
//         final allListChecked = CheckBoxList.every((element) => element.value);
//         AllChecked.value = allListChecked;
//       }
//     });
//   }
// }

// class checkboxModal {
//   bool value;

//   checkboxModal({this.value = false});
// }
