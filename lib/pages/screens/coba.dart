import 'package:flutter/material.dart';

class Checkboxl extends StatefulWidget {
  Checkboxl({Key? key}) : super(key: key);

  @override
  State<Checkboxl> createState() => _CheckboxlState();
}

class _CheckboxlState extends State<Checkboxl> {
  final AllChecked = checkboxModal(title: 'All Checked');
  final CheckBoxList = [
    checkboxModal(title: 'Checkbox 1'),
    checkboxModal(title: 'Checkbox 2'),
    checkboxModal(title: 'Checkbox 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('checkbox'),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => onAllClicked(AllChecked),
              leading: Checkbox(
                value: AllChecked.value,
                onChanged: (value) => onAllClicked(AllChecked),
              ),
              title: Text(AllChecked.title),
            ),
            Divider(),
            ...CheckBoxList.map(
              (item) => ListTile(
                onTap: () => onItemClicked(item),
                leading: Checkbox(
                  value: item.value,
                  onChanged: (value) => onItemClicked(item),
                ),
                title: Text(item.title),
              ),
            ).toList()
          ],
        ),
      ),
    );
  }

  onAllClicked(checkboxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      CheckBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(checkboxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue) {
        AllChecked.value = false;
      } else {
        final allListChecked = CheckBoxList.every((element) => element.value);
        AllChecked.value = allListChecked;
      }
    });
  }
}

class checkboxModal {
  String title;
  bool value;

  checkboxModal({required this.title, this.value = false});
}

// class MyCustomTabBar extends StatefulWidget {
//   @override
//   _MyCustomTabBarState createState() => _MyCustomTabBarState();
// }

// class _MyCustomTabBarState extends State<MyCustomTabBar>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final List<String> tabs = [
//     'Budidaya',
//     'Hama Penyakit',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabs.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Widget _buildTab({String? title, bool? isActive}) {
//     return Container(
//       height: 50,
//       child: Center(
//         child: Text(
//           title!,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: isActive! ? Colors.blue : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () {},
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Cabai',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Image(
//                     image: AssetImage('assets/img/bg-cabai.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   top: 100,
//                   left: 20,
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10),
//                         width: 78,
//                         height: 78,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.white,
//                         ),
//                         child: Image(image: AssetImage('assets/img/cabai.png')),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Cabai',
//                               style: TextStyle(
//                                   fontSize: 23, fontWeight: FontWeight.w600),
//                             ),
//                             Text(
//                               'Capsicum annum',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   fontStyle: FontStyle.italic),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 88,
//           ),
//           Container(
//             height: 50,
//             color: Colors.grey[200],
//             child: TabBar(
//               controller: _tabController,
//               indicator: UnderlineTabIndicator(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//                 borderSide: BorderSide(
//                   width: 3,
//                   color: Colors.blue,
//                 ),
//                 insets: EdgeInsets.symmetric(horizontal: 52.5),
//               ),
//               tabs: tabs.map((String title) {
//                 return _buildTab(
//                   title: title,
//                   isActive: _tabController.index == tabs.indexOf(title),
//                 );
//               }).toList(),
//               onTap: (index) {
//                 setState(() {});
//               },
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 Center(child: Text('Tab 1 Content')),
//                 Center(child: Text('Tab 2 Content')),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


