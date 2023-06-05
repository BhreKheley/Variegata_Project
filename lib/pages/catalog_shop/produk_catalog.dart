import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:variegata_project/pages/catalog_shop/tanaman_catalog.dart';

import '../../common/widget/product_card.dart';

class DetailProduk extends StatefulWidget {
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
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: _isScrolled ? Colors.white : Colors.blue,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: _isScrolled ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopTanaman()),
                      );
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: _isScrolled ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        // Aksi saat ikon Love ditekan
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: _isScrolled ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        // Aksi saat ikon Share ditekan
                      },
                    ),
                  ],
                  floating: true,
                  pinned: true,
                  expandedHeight: 270,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/img/bibit_aloevera.png',
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
                                "Rp59.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 33,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
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
                                                    fontSize: 18,
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
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          // Menambahkan garis di antara kedua teks
                                          color: Color(0xFFD9D9D9),
                                          thickness: 1.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Min. Pemesanan",
                                              style: TextStyle(
                                                  color: Color(0xFF585858),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              "1 Buah",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          // Menambahkan garis di antara kedua teks
                                          color: Color(0xFFD9D9D9),
                                          thickness: 1.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Kategori",
                                              style: TextStyle(
                                                  color: Color(0xFF585858),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 95,
                                            ),
                                            Text(
                                              "Tanaman",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          // Menambahkan garis di antara kedua teks
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        ReadMoreText(
                                          "Spesifikasi Produk:\n"
                                          "- Bibit ini jenis Aloevera Chinensis dengan ukuran besar/jumbo setelah tumbuh besar/dewasa\n"
                                          "- Hanya dikirimkan bibitnya saja tanpa tanah/media tanam\n"
                                          "- Panjang pelepah bibit lidah buaya sekitar 25-35 cm (tidak tentu)\n"
                                          "- Segera tanam bibit agar dapat tumbuh baik dan subur\n"
                                          "- FRESH (Dipanen dari kebun sendiri)\n"
                                          "- FREE PACKING KARDUS- GARANSI PRODUK\n\n"
                                          "Untuk diperhatikan:\n"
                                          "- Pengiriman hanya dilakukan hari Senin-Sabtu. (Hari minggu & tanggal merah libur)\n"
                                          "- Pesanan yang masuk setelah pukul 14.30 WIB akan dikirimkan pada hari berikutnya\n"
                                          "- Untuk menjaga kualitas produk kami TIDAK MENYARANKAN menggunakan pengiriman HEMAT. Kesalahan pengiriman karena kesalahan ekspedisi diluar tanggung jawab kami.\n\n"
                                          "Kami menerima pembelian dalam jumlah besar dengan harga LEBIH MURAH. Silakan chat langsung Kami :)\n\n"
                                          "Lidah Buaya/Aloevera memiliki banyak manfaat diantaranya untuk membantu mengatasi masalah pencernaan, membantu menyembuhkan luka bakar, sebagai masker, penyubur rambut dan lainnya.\n\n",
                                          trimLines: 8,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText:
                                              "Baca lebih lanjut",
                                          trimExpandedText:
                                              "Lihat lebih sedikit",
                                          colorClickableText: Color(0xFFBBD6B8),
                                          style: TextStyle(
                                              color: Color(0xFF585858),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
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
                          // Menambahkan garis di antara kedua teks
                          color: Color(0xFFD9D9D9),
                          thickness: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 25, right: 20),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Produk lainnya',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Color(0xFF94AF9F),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 300,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: ProductCard(
                                      image: 'pupuk_merah.png',
                                      title:
                                          'Pupuk NPK phonska plus 15-15-15 kemasan pabrik 25kg',
                                      price: 'Rp459.000',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: ProductCard(
                                      image: 'fullset_alat.png',
                                      title:
                                          'Alat berkebun menanam cangkul sekop tanah tanaman hobi cocok tanam',
                                      price: 'Rp59.000',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: ProductCard(
                                      image: 'pupuk_merah.png',
                                      title:
                                          'Pupuk NPK phonska plus 15-15-15 kemasan pabrik 25kg',
                                      price: 'Rp459.000',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: ProductCard(
                                      image: 'fullset_alat.png',
                                      title:
                                          'Alat berkebun menanam cangkul sekop tanah tanaman hobi cocok tanam',
                                      price: 'Rp59.000',
                                    ),
                                  ),
                                  ProductCard(
                                    image: 'benih_tomat.png',
                                    title:
                                        '(1 Pack) Benih buah tomat unggul WARANI F1',
                                    price: 'Rp17.000',
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Divider(
                          // Menambahkan garis di antara kedua teks
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Lihat Semua',
                                      style: TextStyle(
                                        color: Color(0xFF94AF9F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
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
                                // Menambahkan garis di antara kedua teks
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
                      decoration:
                          BoxDecoration(color: Color(0xFFF6F7FA), boxShadow: [
                        BoxShadow(
                            blurRadius: 14,
                            blurStyle: BlurStyle.normal,
                            color: Colors.black.withOpacity(0.25))
                      ]),
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
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 145,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color(0xFFDDEBA8),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Color(0xFFDDEBA8),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Keranjang",
                                      style: TextStyle(
                                        color: Color(0xFFDDEBA8),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 145,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDDEBA8),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                      "Beli Sekarang",
                                      style: TextStyle(
                                        color: Color(0xFFF6F7FA),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ),
                              ),
                            ],
                          )),
                    ))
              ],
            )),
      ),
    );
  }
}
