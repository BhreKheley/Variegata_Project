import 'package:flutter/material.dart';

// ignore: camel_case_types
class Search_box extends StatefulWidget {
  const Search_box({Key? key}) : super(key: key);

  @override
  State<Search_box> createState() => _Search_boxState();
}

// ignore: camel_case_types
class _Search_boxState extends State<Search_box> {

  // ignore: unnecessary_new, unused_field, non_constant_identifier_names
  final TextEditingController _Searchcontroller = new TextEditingController();

  // List<Data> _search = [];
  // onSearch(String text) async {
  //   setState(() {
  //     _search.clear();
  //     if (text.isEmpty) {
  //       return;
  //     }
  //     productModel!.allDestinasi.forEach((f) {
  //       if (f.nama.toLowerCase().contains(text) ||
  //           f.id.toString().contains(text)) _search.add(f);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 33,
      ),
      width: MediaQuery.of(context).size.width,
      height: 37,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF94AF9F)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFBBD6B8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.only(left: 20),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
