import 'package:flutter/material.dart';

class Search_box extends StatefulWidget {
  Search_box({Key? key}) : super(key: key);

  @override
  State<Search_box> createState() => _Search_boxState();
}

class _Search_boxState extends State<Search_box> {
  TextEditingController _Searchcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 33,
      ),
      width: MediaQuery.of(context).size.width,
      height: 37,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF94AF9F)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBBD6B8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.only(left: 20),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
