// import 'package:flutter/material.dart';
// import 'package:variegata_app/pages/ProfilContent/profile_page.dart';
// import 'package:variegata_app/pages/catalog_shop/dashboard_catalog.dart';
//
// class Favorit extends StatefulWidget {
//   const Favorit({super.key});
//
//   @override
//   State<Favorit> createState() => _FavoritState();
// }
//
// class _FavoritState extends State<Favorit> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF6F7FA),
//       appBar: AppBar(
//         title: Text(
//           "Favorit",
//           style: TextStyle(color: Color(0xFF33363F)),
//         ),
//         backgroundColor: Color(0xFFF6F7FA),
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Color(0xFF33363F),
//           onPressed: () {
//             Navigator.pop(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ProfilePage(),
//               ),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 204),
//             child: Center(
//               child: Image(
//                 image: AssetImage("assets/img/wishlist.png"),
//                 width: 130,
//                 height: 108,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 20,
//               top: 16,
//               right: 20,
//             ),
//             child: Center(
//               child: Text(
//                 "Favorit Anda kosong saat ini.",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 23,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 20,
//               top: 13,
//               right: 20,
//             ),
//             child: Center(
//               child: Text(
//                 "Yuk, mulai tambahkan item favorit Anda!",
//                 style: TextStyle(
//                     color: Color(0xFF505050),
//                     fontSize: 17,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, top: 22, right: 20),
//             child: Center(
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => KatalogShop()));
//                 },
//                 style: TextButton.styleFrom(
//                   minimumSize: Size(147, 36),
//                   backgroundColor: Color(0xFFF6F7FA),
//                   side: BorderSide(color: Colors.black, width: 2),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0)),
//                 ),
//                 child: Text(
//                   "Tambahkan Sekarang",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }