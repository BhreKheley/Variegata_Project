import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:variegata_project/pages/catalog_shop/Detail_Toko.dart';

class Katalog extends StatelessWidget {
  const Katalog({Key? key}) : super(key: key);

  final String url = 'http://variegata.my.id/api/products';

  Future getProducts() async{
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Test API'),
      // ),
      body: FutureBuilder(
          future: getProducts(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: (snapshot.data as dynamic)['data'].length,
                  itemBuilder: (context, index) {
                    return Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child:Container(
                                      width: 140,
                                      height: 231,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: -4,
                                            blurRadius: 14,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                              DetailProduk(product: (snapshot.data as dynamic)['data'][index],
                                              )));
                                        },
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(5),
                                              ),
                                              child: Image.network(
                                                (snapshot.data as dynamic)['data'][index]['image_url'],
                                                alignment: Alignment.topCenter,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: 110,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 9),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text((snapshot.data as dynamic) ['data'][index]['name'],
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 9,
                                                  ),
                                                  Text((snapshot.data as dynamic) ['data'][index]['price'],
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 9,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: Color(0xFFBBD6B8),
                                                        size: 15,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        'Kudus',
                                                        style: TextStyle(
                                                            color: Color(0xFFADADAD),
                                                            fontSize: 9,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 2),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Color(0xFFFFC400),
                                                        size: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        '4.9 | Belum Terjual',
                                                        style: TextStyle(
                                                            color: Color(0xFFADADAD),
                                                            fontSize: 9,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.more_horiz,
                                                  color: Color(0xFFADADAD),
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                  });
            }else{
              return Text('Data eror');
            }
          }
      ),
    );
  }
}
