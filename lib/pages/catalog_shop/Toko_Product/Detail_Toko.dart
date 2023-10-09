import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:variegata_project/pages/Ulasan_Pembeli/Ulasan.dart';
import 'package:variegata_project/pages/catalog_shop/Keranjang/Instan_Buy.dart';
import 'package:variegata_project/pages/catalog_shop/Keranjang/cart.dart';


class DetailProduk extends StatefulWidget {
  final dynamic product;
  DetailProduk({required this.product});

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _isScrolled = _scrollController.offset > 0;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _addToCart() async {
    final productId = widget.product['id'];
    final quantity = 1;

    final availableStock = int.tryParse(widget.product['stock']) ?? 0;

    if (availableStock >= quantity) {
      final response = await http.post(
        Uri.parse('https://variegata.my.id/api/add-to-cart'),
        body: {
          'product_id': productId.toString(),
          'quantity': quantity.toString(),
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData.containsKey('message')) {
          final message = responseData['message'];

          if (message == 'Product is already in the cart') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Produk sudah ada di dalam keranjang'),
              ),
            );
          } else {
            // Produk berhasil ditambahkan, perbarui stok setelah pesanan berhasil ditempatkan.
            await _updateStock(productId, availableStock - quantity);

            setState(() {
              widget.product['stock'] = (availableStock - quantity).toString();
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Produk berhasil ditambahkan'),
              ),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menambahkan produk ke keranjang'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Stok produk tidak mencukupi'),
        ),
      );
    }
  }

  Future<void> _updateStock(int productId, int newStock) async {
    final response = await http.put(
      Uri.parse('https://variegata.my.id/api/products/$productId/update-stock'),
      body: {
        'quantity': newStock.toString(),
      },
    );

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memperbarui stok produk'),
        ),
      );
    }
  }

  // Fungsi untuk mengambil data produk terbaru dari server
  Future<void> _fetchProductData() async {
    final productId = widget.product['id'];
    final response = await http.get(
      Uri.parse('https://variegata.my.id/api/products/$productId'),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        widget.product['stock'] = responseData['stock'].toString();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengambil data produk terbaru'),
        ),
      );
    }
  }

  Future<void> _buyNow() async {
    final productId = widget.product['id'];
    final quantity = 1;

    final availableStock = int.tryParse(widget.product['stock']) ?? 0;

    if (availableStock >= quantity) {
      final response = await http.post(
        Uri.parse('https://variegata.my.id/api/keranjang/tambah'),
        body: {
          'product_id': productId.toString(),
          'quantity': quantity.toString(),
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData.containsKey('message')) {
          final message = responseData['message'];

          if (message == 'Product is already in the cart') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Produk sudah ada di dalam keranjang'),
              ),
            );
          } else {
            // Produk berhasil ditambahkan, perbarui stok setelah pesanan berhasil ditempatkan.
            await _updateStock(productId, availableStock - quantity);

            setState(() {
              widget.product['stock'] = (availableStock - quantity).toString();
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Produk berhasil ditambahkan'),
              ),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menambahkan produk ke keranjang'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Stok produk tidak mencukupi'),
        ),
      );
    }
  }

  String formatPrice(String price) {
    double parsedPrice = double.tryParse(price) ?? 0.0;

    String formattedPrice = 'Rp ' +
        parsedPrice.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]}.',
        );

    return formattedPrice;
  }

  void _openWhatsAppChat() async {
    final phoneNumber = ''
        '+6285702216485'; // Ganti dengan nomor telepon tujuan Anda
    final message = 'Halo, saya tertarik dengan produk ini'; // Pesan awal (opsional)

    final url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle jika tidak dapat membuka WhatsApp
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal membuka WhatsApp'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          setState(() {
            _isScrolled = _scrollController.offset > 0;
          });
          return true;
        },
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: _isScrolled ? Colors.white : Colors.blue,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: _isScrolled ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: _isScrolled ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cart(),
                        ),
                      );
                    },
                  ),
                ],
                floating: true,
                pinned: true,
                expandedHeight: 270,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://variegata.my.id/storage/${widget.product['image']}',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Icon(Icons.error);
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.only(left: 20, top: 25, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${formatPrice(widget.product['price'])}',
                              style: TextStyle(
                                  color: Colors.red, fontSize: 16),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Detail Produk",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Kondisi",
                                              style: TextStyle(
                                                  color: Color(0xFF585858),
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Text(
                                              "Baru",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0xFFD9D9D9),
                                        thickness: 1.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Stock Product",
                                            style: TextStyle(
                                                color: Color(0xFF585858),
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            widget.product['stock'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Color(0xFFD9D9D9),
                                        thickness: 1.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Kategori",
                                            style: TextStyle(
                                                color: Color(0xFF585858),
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 95,
                                          ),
                                          Text(
                                            "Tanaman",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Color(0xFFD9D9D9),
                                        thickness: 1.0,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Deskripsi Produk",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      ReadMoreText(
                                        widget.product['description'],
                                        trimLines: 15,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText:
                                        "Baca lebih lanjut",
                                        trimExpandedText:
                                        "Lihat lebih sedikit",
                                        colorClickableText: Color(0xFFBBD6B8),
                                        style: TextStyle(
                                            color: Color(0xFF585858),
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xFFD9D9D9),
                        thickness: 3,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 25, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ulasan pembeli',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const UlasanPembeli()),
                                      );
                                    },
                                    child: Text(
                                      'Lihat Semua',
                                      style: TextStyle(
                                          color: Color(0xFF94AF9F),
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 8, right: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC400),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC400),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC400),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC400),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFD9D9D9),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "4.9/5",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "(1000 Ulasan)",
                                    style: TextStyle(
                                        color: Color(0xFF585858),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: Color(0xFFD9D9D9),
                              thickness: 1,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 15, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.person,
                                          color: Color(0xFF90AF9D),
                                        ),
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          color: Color(0xFFECF4EB),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 17,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Icikiwir Icikonde",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            children: List.generate(
                                              5,
                                                  (index) => Icon(
                                                Icons.star,
                                                color: Color(0xFFFFC400),
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Proses dan pengiriman cepat, kemasan baik rapih, kualitas produk baik, sesuai pesanan, gambar dan deskripsi :)",
                                    style: TextStyle(
                                        color: Color(0xFF585858),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F7FA),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 14,
                        blurStyle: BlurStyle.normal,
                        color: Colors.black.withOpacity(0.25),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 54,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _openWhatsAppChat();
                            },
                            child: Icon(
                              Icons.chat,
                              color: Color(0xFF94AF9F),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _addToCart();
                          },
                          child: Container(
                            width: 135,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0xFF94AF9F),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Color(0xFF94AF9F),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "Keranjang",
                                  style: TextStyle(
                                    color: Color(0xFF94AF9F),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _buyNow();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Keranjang(),
                              ),
                            );
                          },
                          child: Container(
                            width: 135,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFF94AF9F),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Beli Sekarang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
