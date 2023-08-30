import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;

  const RoundedButton(
      {Key? key, required this.btnText, required this.onBtnPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Color(0xFFE2EFE1),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {
          onBtnPressed();
        },
        minWidth: MediaQuery.of(context).size.width,
        height: 50,
        child: Text(
          btnText,
          style: const TextStyle(color: Color(0xFF505050), fontSize: 16),
        ),
      ),
    );
  }
}
