import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:variegata_project/pages/catalog_shop/Mini_map.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Map<int, int> productQuantities = {};
  double totalHarga = 0.0;
  bool adaItemDipilih = false;
  List<dynamic> cartItems = [];
  List<Map<String, dynamic>> selectedProducts = [];

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  void updateAllCheckbox(bool? value) {
    if (value != null) {
      setState(() {
        allCheckbox = value;
        for (var cartItem in cartItems) {
          cartItem['isChecked'] = value;
        }
        calculateTotalHarga();
      });
    }
  }

  Future<void> fetchCartItems() async {
    final response = await http.get(Uri.parse('http://variegata.my.id/api/cart'));
    if (response.statusCode == 200) {
      setState(() {
        cartItems = json.decode(response.body);
        for (var cartItem in cartItems) {
          cartItem['isChecked'] = false; // Set default value for isChecked
        }
        calculateTotalHarga();
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  Future<void> deleteCartItem(int cartItemId, int index) async {
    try {
      final response = await http.delete(
        Uri.parse('http://variegata.my.id/api/remove-from-cart/$cartItemId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          cartItems.removeAt(index);
          calculateTotalHarga();
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> _showDeleteConfirmationDialog(int cartItemId, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Yakin ingin menghapus item ini dari keranjang?'),
          actions: <Widget>[
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                deleteCartItem(cartItemId, index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> updateCartItemCheckbox(int cartItemId, bool isChecked, int index) async {
    int quantity = isChecked ? 1 : 0;
    await updateCartItem(cartItemId, quantity);

    setState(() {
      cartItems[index]['isChecked'] = isChecked;
      if (cartItems.every((item) => item['isChecked'])) {
        allCheckbox = true;
      } else {
        allCheckbox = false;
      }
      adaItemDipilih = cartItems.any((item) => item['isChecked']);
    });

    calculateTotalHarga();
  }

  Future<void> updateCartItem(int cartItemId, int quantity) async {
    try {
      final response = await http.get(Uri.parse('http://variegata.my.id/api/update-cart-item/$cartItemId?quantity=$quantity'));
      if (response.statusCode == 200) {
        setState(() {
          cartItems = json.decode(response.body);
          calculateTotalHarga();
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void calculateTotalHarga() {
    double total = 0.0;
    for (var cartItem in cartItems) {
      if (cartItem['isChecked']) {
        int quantity = productQuantities[cartItem['product']['id']] ?? 1;
        double price = double.parse(cartItem['product']['price']);
        total += quantity * price;
      }
    }
    setState(() {
      totalHarga = total;
    });
  }

  void incrementQuantity(int productId) {
    setState(() {
      if (productQuantities.containsKey(productId)) {
        productQuantities[productId] = productQuantities[productId]! + 1;
      } else {
        productQuantities[productId] = 1;
      }
      calculateTotalHarga();
    });
  }

  void decrementQuantity(int productId) {
    setState(() {
      if (productQuantities.containsKey(productId)) {
        if (productQuantities[productId]! > 1) {
          productQuantities[productId] = productQuantities[productId]! - 1;
        } else {
          productQuantities.remove(productId);
        }
        calculateTotalHarga();
      }
    });
  }

  bool allCheckbox = false;

  String formatPrice(double price) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0)
        .format(price);
  }

  String formatTotalHarga(double totalHarga) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0)
        .format(totalHarga);
  }

  void checkoutAndNavigate() {
    selectedProducts.clear();
    for (var cartItem in cartItems) {
      if (cartItem['isChecked']) {
        selectedProducts.add({
          'name': cartItem['product']['name'],
          'quantity': productQuantities[cartItem['product']['id']] ?? 1,
          'image': cartItem['product']['image'],
          'price': cartItem['product']['price'],
        });
      }
    }

    if (selectedProducts.isNotEmpty) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Order(selectedProducts: selectedProducts),
      //   ),
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MiniMap(selectedProducts: selectedProducts),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Harap pilih item untuk melanjutkan")),
      );
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
                    onChanged: updateAllCheckbox,
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
          cartItems.isEmpty
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/img/Cart.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Keranjang Anda kosong saat ini',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
              : Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                final productId = cartItem['product']['id'];
                final cartItemId = cartItem['id'];
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
                          value: cartItem['isChecked'],
                          onChanged: (isChecked) {
                            allCheckbox = cartItems.every((item) => item['isChecked']);
                            setState(() {
                              cartItems[index]['isChecked'] = isChecked;
                              if (!isChecked!) {
                                allCheckbox = false;
                              } else if (cartItems.every((item) => item['isChecked'])) {
                                allCheckbox = true;
                              }
                            });

                            updateCartItemCheckbox(cartItemId, isChecked!, index);
                          },
                          activeColor: Color(0xFF94AF9F),
                        ),
                      ),
                      Container(
                        width: 325,
                        height: 120,
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
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://variegata.my.id/storage/${cartItem['product']['image']}',
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    width: 85,
                                    height: 85,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Produk',
                                            style: TextStyle(
                                              color: Color(0xFFADADAD),
                                              fontSize: 10,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showDeleteConfirmationDialog(cartItem['id'], index);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              size: 20,
                                            ),
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
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 169,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  decrementQuantity(productId);
                                                },
                                                child: Icon(
                                                  Icons.remove_circle_outline,
                                                  size: 25,
                                                  color: Color(0xFF94AF9F),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Text(
                                                  '${productQuantities[productId] ?? 1}',
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  incrementQuantity(productId);
                                                },
                                                child: Icon(
                                                  Icons.add_circle_outline,
                                                  size: 25,
                                                  color: Color(0xFF94AF9F),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            " ${formatPrice(double.parse(cartItem['product']['price']))}",
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
              Text(
                'Pesanan Anda',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 14,
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
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatTotalHarga(totalHarga),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
                  onTap: checkoutAndNavigate,
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