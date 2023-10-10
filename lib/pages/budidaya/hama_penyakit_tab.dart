// import 'package:flutter/material.dart';
// import 'package:variegata_project/pages/budidaya/Detail_Hama.dart';
//
// class HamaPenyakit extends StatelessWidget {
//   const HamaPenyakit({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(bottom: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Daftar Hama & Penyakit",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Tanaman rentan terhadap serangan hama dan penyakit yang dapat mengancam pertumbuhan dan hasil panen.",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailHamaPenyakit(),
//                     ));
//               },
//               child: CardHama(
//                 'hama.png',
//                 'Kutu Daun',
//                 'Aphids',
//               ),
//             ),
//             CardHama(
//               'hama.png',
//               'Kutu Daun',
//               'Aphids',
//             ),
//             CardHama(
//               'hama.png',
//               'Kutu Daun',
//               'Aphids',
//             ),
//             CardHama(
//               'hama.png',
//               'Kutu Daun',
//               'Aphids',
//             ),
//             CardHama(
//               'hama.png',
//               'Kutu Daun',
//               'Aphids',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget CardHama(String image, String title, String subTitle) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 86,
//                 height: 79,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5), // Warna shadow
//                       spreadRadius: 2, // Jarak penyebaran shadow
//                       blurRadius: 5, // Radius blur shadow
//                       offset: Offset(0, 2), // Offset atau posisi shadow
//                     ),
//                   ],
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/img/$image',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 11),
//                 width: 2,
//                 height: 57,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color(0xFFDEDEDE),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title.toString(),
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     subTitle.toString(),
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 18,
//                         height: 18,
//                         child: Image(
//                           image: AssetImage('assets/img/hama_icon.png'),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Hama",
//                         style: TextStyle(
//                           color: Color(0xff7f7f7f),
//                           fontSize: 15,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             size: 30,
//           )
//         ],
//       ),
//     );
//   }
// }
