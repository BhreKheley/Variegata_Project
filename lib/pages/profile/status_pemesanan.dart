import 'package:flutter/material.dart';
import 'package:variegata_project/pages/profile/profile_page.dart';
import 'package:variegata_project/pages/profile/tabs/tab_dikirim.dart';
import 'package:variegata_project/pages/profile/tabs/tab_diproses.dart';
import 'package:variegata_project/pages/profile/tabs/tab_diterima.dart';

class StatusPemesanan extends StatefulWidget {
  const StatusPemesanan({super.key});

  @override
  State<StatusPemesanan> createState() => _StatusPemesananState();
}

class _StatusPemesananState extends State<StatusPemesanan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F7FA),
        appBar: AppBar(
          title: Text(
            "Status Pemesanan",
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
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.hourglass_empty_outlined,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.local_shipping_outlined,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                //Tab-Diproses
                TabDiproses(),
                //Tab-Dikirim
                TabDikirim(),
                //Tab-Diterima
                TabDiterima()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
