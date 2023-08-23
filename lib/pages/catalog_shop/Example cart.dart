import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/alamat.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ExampleCart extends StatefulWidget {
  const ExampleCart({super.key});

  @override
  State<ExampleCart> createState() => _ExampleCartState();
}

class _ExampleCartState extends State<ExampleCart> {

  List<dynamic> cartItems = [];

  Future<void> fetchCartItems() async {
    final response = await http.get(Uri.parse('http://variegata.my.id/api/cart'));
    if (response.statusCode == 200) {
      setState(() {
        cartItems = json.decode(response.body);
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    try {
      final response = await http.get(Uri.parse('http://variegata.my.id/api/remove-from-cart/$cartItemId'));
      if (response.statusCode == 200) {
        setState(() {
          cartItems = json.decode(response.body);
        });
      } else {
        // Handle error
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateCartItem(int cartItemId, int quantity) async {
    try {
      final response = await http.get(Uri.parse('http://variegata.my.id/api/update-cart-item/$cartItemId'));
      if (response.statusCode == 200) {
        setState(() {
          cartItems = json.decode(response.body);
        });
      } else {
        // Handle error
      }
    } catch (e) {
      print("Error: $e");
    }

  }

  Future<double> calculateTotalPrice() async {
    final response = await http.get(Uri.parse('http://variegata.my.id/api/calculate-total-price'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final totalPrice = double.parse(data['total_price']);
      return totalPrice;
    } else {
      throw Exception('Failed to load total price');
    }
  }


  bool allCheckbox = false;
  List<bool> CheckBoxList = [
    for (var i = 0; i <= 3; i++) false,
  ];

  bool? isChecked = false;

  int quantity = 1;

  Future<void> increment(dynamic cartItem, int index) async {
    setState(() {
      cartItem['quantity']++;
      updateCartItem(cartItem['id'], cartItem['quantity']);
      cartItems[index] = cartItem;
    });
  }

  Future<void> decrement(dynamic cartItem, int index) async {
    if (cartItem['quantity'] > 1) {
      setState(() {
        cartItem['quantity']--;
        updateCartItem(cartItem['id'], cartItem['quantity']);
        cartItems[index] = cartItem;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCartItems();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
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
                    scale: 1.2,
                    child: Checkbox(
                      value: allCheckbox,
                      onChanged: (value) {
                        setState(() {
                          allCheckbox = value!;
                          for (var i = 0; i < 3; i++) CheckBoxList[i] = value!;
                        });
                      },
                      activeColor: Color(0xFF94AF9F),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
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
            Divider(
              thickness: 3,
              color: Color(0xFFEBEBEB),
            ),
            ListView.builder(
              itemCount: cartItems.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 7,
                    top: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: CheckBoxList[index],
                          onChanged: (val) {
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
                          activeColor: Color(0xFF94AF9F),
                        ),
                      ),
                      Container(
                        width: 325,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 9,
                            top: 9,
                            bottom: 9,
                            right: 35,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://variegata.my.id/storage/${cartItem['product']['image']}',
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Row(
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
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () async {
                                              await removeFromCart(cartItem['id']);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Text(
                                        cartItem['product']['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 170,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  decrement(cartItem, index);
                                                },
                                                child: Icon(
                                                  Icons.remove_circle_outline,
                                                  size: 22,
                                                  color: Color(0xFF94AF9F),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Text(
                                                  '$quantity',
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  increment(cartItem, index);
                                                },
                                                child: Icon(
                                                  Icons.add_circle_outline,
                                                  size: 22,
                                                  color: Color(0xFF94AF9F),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Rp${cartItem['product']['price']}",
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
              Text(
                'Pesanan Anda',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      FutureBuilder<double>(
                        future: calculateTotalPrice(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            final totalPrice = snapshot.data ?? 0.0;
                            return Text(
                              "Rp ${totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }
                        },
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
                      MaterialPageRoute(builder: (context) => Alamat()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Color(0xffa3bfae),
                    ),
                    child: Column(
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