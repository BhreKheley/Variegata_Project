import 'package:flutter/material.dart';
import 'package:variegata_project/pages/budidaya_detail.dart';
import 'package:variegata_project/pages/dashboard/dashboard_page.dart';

class BudidayaPage extends StatefulWidget {
  BudidayaPage({Key? key}) : super(key: key);

  @override
  State<BudidayaPage> createState() => _BudidayaPageState();
}

class _BudidayaPageState extends State<BudidayaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text(
          "Budidaya",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailBudidaya(),
                    ),
                  );
                },
                child: cardsBudidaya(
                  'Cabai',
                  'Capsicum annum',
                ),
              ),
              cardsBudidaya(
                'Alpukat',
                'Persea americana',
              ),
              cardsBudidaya(
                'Bawang Bombai',
                'Allium cepa',
              ),
              cardsBudidaya(
                'Bawang Merah',
                'Allium cepa var. aggregatum',
              ),
              cardsBudidaya(
                'Bawang Putih',
                'Allium sativum',
              ),
              cardsBudidaya(
                'Apel',
                'Malus domestica',
              ),
              cardsBudidaya(
                'Delima',
                'Punica granatum',
              ),
              cardsBudidaya(
                'Jagung',
                'Zea mays',
              ),
              cardsBudidaya(
                'Kentang',
                'Solanum tuberosum',
              ),
              cardsBudidaya(
                'Tomat',
                'Solanum lycopersicum',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardsBudidaya(String title, String subTitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      width: MediaQuery.of(context).size.width,
      height: 90,
      color: Color(0xFFF6F7FA),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Image(image: AssetImage('assets/img/cabai.png')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subTitle.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
