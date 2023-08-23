import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:variegata_project/pages/catalog_shop/alamat.dart';
import 'package:variegata_project/pages/catalog_shop/ganti_alamat.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

List<String> options = ['Option 1', 'Option 2'];

class _CheckoutState extends State<Checkout> {
  String currentOption = options[0];

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
              MaterialPageRoute(
                builder: (context) => Alamat(),
              ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GantiAlamat()),
                      );
                    },
                    child: Container(
                      child: Text(
                        "Ganti Alamat",
                        style: TextStyle(
                          color: Color(0xFF94AF9F),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 355,
                height: 118,
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
                                      "+6283877176448",
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 240,
                            child: Text(
                              "Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat, 16435, Indonesia",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 17,
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
              Container(
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
                                height: 5,
                              ),
                              Text(
                                "1 Barang",
                                style: TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rp150.000",
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
              SizedBox(
                height: 30,
              ),
              Text(
                "Pilihan Pengiriman",
                style: TextStyle(
                  color: Color(0xFF505050),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(

                      isScrollControlled: true,
                      context: context,
                      isDismissible: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      builder: ((context) {
                        return Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDADADA),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDADADA),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Text(
                                  "Pilih Waktu Pengiriman ",
                                  style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              OngkirContent(),
                              SizedBox(
                                height: 20,
                              ),
                              OngkirContent(),
                              SizedBox(
                                height: 20,
                              ),
                              OngkirContent(),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: 355,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      "Simpan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF9ED098),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          ),
                        );
                      }));
                },
                child: Container(
                  width: 355,
                  height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Klik untuk pilih",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Color(0xFF94AF9F),
                          size: 34,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
              Container(
                width: 355,
                height: 178,
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
                            "Subtotal  Produk (1 Item)",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Rp150.000",
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
                            "Ringkasan Pembayaran",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Rp150.000",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
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
                            "Biaya Layanan",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Rp2.000",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
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
        height: 86,
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
                      "Rp150.000",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alamat()),
                    );
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

  Widget OngkirContent() {
    return Container(
      width: 355,
      height: 97,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Variegata Reguler",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Rp12.000 - Rp15.000",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Estimasi tiba 10 - 14 Aug",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Radio(
                activeColor: Color(0xFF91C6A6),
                value: options[1],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                }),
          ],
        ),
      ),
    );
  }
}