import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'package:variegata_project/pages/profile/riwayat_pembelian.dart';

class DetailPemesanan extends StatefulWidget {
  const DetailPemesanan({super.key});

  @override
  State<DetailPemesanan> createState() => _DetailPemesananState();
}

class _DetailPemesananState extends State<DetailPemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Detail Pemesanan",
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
                builder: (context) => RiwayatPembelian(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE2F4E9),
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: Text(
                          "Selesai",
                          style: TextStyle(
                              color: Color(0xFF458A61),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID Pemesanan",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "NFJA8FBAIJSBF0",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
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
                          "Tanggal Pembelian",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "29 Agustus 2023",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
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
                          "Total Tagihan",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Rp150.000",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 6,
                color: Color(0xFFD9D9D9),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ringkasan Pemesanan",
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 355,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFDBDBDB),
                              offset: Offset(0, 0),
                              blurRadius: 9,
                              spreadRadius: -4,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 15),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/img/produk-philodendron.png"),
                                    width: 47,
                                    height: 47,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 260,
                                        child: Text(
                                          'Tanaman Philodendron Monstera Deliciosa',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '1 barang',
                                        style: TextStyle(
                                          color: Color(0xFFADADAD),
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0xFFD9D9D9),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Belanja",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Rp150.000",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 102,
                                  height: 31,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(3),
                                      border:
                                          Border.all(color: Color(0xFF9ED098))),
                                  child: Center(
                                    child: Text(
                                      "Beli Lagi",
                                      style: TextStyle(
                                          color: Color(0xFF9ED098),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
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
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 6,
                color: Color(0xFFD9D9D9),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Info Pengiriman",
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kurir",
                                style: TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "No Resi",
                                style: TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Alamat",
                                style: TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kurir Rekomendasi - Reguler",
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "DAS860DA-98273GH",
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "BhreKheley",
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "+6283877176448",
                              style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 225,
                              child: Text(
                                "Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat, 16435, Indonesia",
                                style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 6,
                color: Color(0xFFD9D9D9),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rincian Pembayaran",
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kurir",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "COD",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Harga",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Rp150.000",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
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
                          "Total Ongkos Kirim (Reguler)",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Rp13.000",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Belanja",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Rp163.000",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KatalogShop()),
                        );
                      },
                      child: Container(
                        width: 355,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9ED098),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Center(
                          child: Text(
                            "Beli Lagi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
