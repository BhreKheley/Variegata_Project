import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/checkout.dart';

class GantiAlamat extends StatefulWidget {
  const GantiAlamat({super.key});

  @override
  State<GantiAlamat> createState() => _GantiAlamatState();
}

List<String> options = ['Option 1', 'Option 2'];

class _GantiAlamatState extends State<GantiAlamat> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Daftar Alamat Saya",
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
                builder: (context) => Checkout(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            //alamat 1
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
                    Radio(
                        activeColor: Color(0xFF91C6A6),
                        value: options[0],
                        groupValue: currentOption,
                        onChanged: (value) {
                          setState(() {
                            currentOption = value.toString();
                          });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //alamat 2
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 355,
              height: 98,
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
                                Image(
                                  image: AssetImage("assets/img/pin.png"),
                                  width: 14,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Center(
                                  child: Text(
                                    "Klik untuk tambah alamat",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
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
                        Text(
                          "Pilih titik lokasi yang sesuai atau mendekati",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
