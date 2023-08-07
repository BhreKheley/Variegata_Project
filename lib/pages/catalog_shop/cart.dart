import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Keranjang",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => KatalogShop(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Text(
              "Pesanan Anda",
              style: TextStyle(
                  color: Color(0xFFADADAD),
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 7,
              top: 10,
            ),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Pilih Semua",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 6,
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
                  right: 20,
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 308,
                      height: 107,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 9,
                          top: 9,
                          right: 9,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage(
                                    "assets/img/produk-philodendron.png"),
                                width: 88,
                                height: 89,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tanaman",
                                        style: TextStyle(
                                            color: Color(0xFFADADAD),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 129,
                                      ),
                                      Icon(
                                        Icons.delete,
                                        size: 17,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  width: 160,
                                  child: Text(
                                    "Tanaman Philodendron Monstera Deliciosa",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          decrement();
                                        },
                                        child: Icon(
                                          Icons.remove_circle_outline,
                                          size: 27,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        '$quantity',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          decrement();
                                        },
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          size: 27,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 44,
                                      ),
                                      Text(
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
        width: 395,
        height: 220,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pesanan Anda",
                style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pengiriman",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rp3.000",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rp150.000",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KatalogShop(),
                        ));
                  },
                  child: Container(
                    width: 320,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Color(0xffa3bfae),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Out",
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
