import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:variegata_project/pages/catalog_shop/Alamat/Alamat.dart';
import 'package:variegata_project/pages/catalog_shop/Checkout/Detail_pesanan_checkout.dart';

class Checkout_AK extends StatefulWidget {
  final List<Map<String, dynamic>> selectedProducts;
  Checkout_AK({required this.selectedProducts});

  @override
  State<Checkout_AK> createState() => _Checkou_AKtState();
}

class _Checkou_AKtState extends State<Checkout_AK> {
  Map<String, dynamic> get firstSelectedProduct =>
      widget.selectedProducts.isNotEmpty ? widget.selectedProducts.first : {};

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in widget.selectedProducts) {
      // Menggunakan fungsi double.tryParse untuk menghindari kesalahan jika 'price' bukan String yang valid
      double price = double.tryParse(product['price']?.toString() ?? '0.0') ?? 0.0;
      int quantity = product['quantity'] ?? 0;
      totalPrice += (price * quantity);
    }
    return totalPrice;
  }

  bool isAddressSelected = false;

  String formatPrice(double price) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0)
        .format(price);
  }

  String formatTotalHarga(double totalHarga) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0)
        .format(totalHarga);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Checkout",
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
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlamatAll(selectedProducts: widget.selectedProducts),
                    ),
                  );
                },
                child: Container(
                  width: 355,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Container(
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Nama",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Center(
                                        child: Text(
                                          "+6285702216485",
                                          style: TextStyle(
                                            color: Color(0xFF505050),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 240,
                              child: Text(
                                "Isi dengan Alamat lengkap rumah, kost atau kantor anda",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/img/lokasi.png"),
                          width: 58,
                          height: 58,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Pesanan Anda",
                style: TextStyle(
                  color: Color(0xFF505050),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Data yang dikirim ke Order: ${widget.selectedProducts}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Order(selectedProducts: widget.selectedProducts),
                        ),
                      );
                    },
                    child: Container(
                      width: 355,
                      height: 197,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                    "assets/img/vector-checkout.svg",
                                    width: 199,
                                    height: 53,
                                  ),
                                  Positioned(
                                    left: 15,
                                    top: 9,
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image(
                                          image: AssetImage("assets/img/logo.png"),
                                          width: 29,
                                          height: 29,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 55,
                                    top: 6,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Variegata",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Kab. Kudus",
                                          style: TextStyle(
                                            color: Color(0xFF505050),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 15,
                              right: 8,
                              bottom: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://variegata.my.id/storage/${firstSelectedProduct['image']}',
                                    width: 88,
                                    height: 89,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tanaman",
                                      style: TextStyle(
                                          color: Color(0xFFADADAD),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      width: 185,
                                      child: Text(
                                        firstSelectedProduct['name'],
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
                                      height: 5,
                                    ),
                                    Text(
                                      "Jumlah ${firstSelectedProduct['quantity']}",
                                      style: TextStyle(
                                          color: Color(0xFFADADAD),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      formatPrice(double.parse(firstSelectedProduct['price'] ?? '0.0')),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 355,
                height: 165,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ringkasan Pembayaran",
                        style: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal  Produk (${widget.selectedProducts.length} Item)",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            formatTotalHarga(calculateTotalPrice()),
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: Color(0xFFF1F1F1),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal Pembayaran",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            formatTotalHarga(calculateTotalPrice()),
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: 395,
        height: 100 ,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 15,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total :",
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      formatTotalHarga(calculateTotalPrice()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Check if an address is selected
                    if (!isAddressSelected) {
                      // Show a snackbar message if the address is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Alamat anda kosong, Silahkan pilih Alamat terlebih dahulu",
                            style: TextStyle(fontSize: 16),
                          ),
                          backgroundColor: Colors.red, // Customize the snackbar color
                        ),
                      );
                    } else {
                      // Navigate to the checkout page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Order(selectedProducts: widget.selectedProducts),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 136,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF9ED098),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
