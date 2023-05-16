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
        top: 13,
        bottom: 33,
        left: 10,
        right: 10,
      ),
      width: 350,
      height: 50,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBBD6B8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
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
