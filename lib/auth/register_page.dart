import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:variegata_project/Services/auth_services.dart';
import 'package:variegata_project/Services/rounded_button.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/common/widget/bottom_navbar.dart';

import '../Services/globals.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  String _email = '';
  String _password = '';
  String _name = '';
  bool _isLoading = false;

  createAccountPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty && _name.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      // Menampilkan dialog dengan CircularProgressIndicator dan pesan "Loading..."
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading..."),
              ],
            ),
          );
        },
      );

      bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0.9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_email);

      if (emailValid) {
        http.Response response =
        await AuthServices.register(_name, _email, _password);
        Map responseMap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          final String token = responseMap['token'];
          await AuthServices.saveTokenToLocalStorage(token);

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token);

          final Map<String, dynamic> userData = responseMap['user']; // Ambil data user dari respons JSON
          final String name = userData['name']; // Ambil "name" dari data user
          final String email = userData['email']; // Ambil "email" dari data user

          // Simpan "name" dan "email" ke penyimpanan lokal
          prefs.setString('name', name);
          prefs.setString('email', email);

          setState(() {
            _isLoading = false;
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const BotNavbar(),
            ),
          );
        } else {
          setState(() {
            _isLoading = false;
          });

          // Menampilkan pesan kesalahan
          errorSnackBar(context, responseMap['message']); // Menggunakan 'message' dari respons API
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        // Tutup dialog
        Navigator.of(context).pop();
        errorSnackBar(context, 'Email is not valid');
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      // Tutup dialog
      Navigator.of(context).pop();
      errorSnackBar(context, 'Please fill in all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Image.asset(
                  "assets/img/VectorRegister.png",
                  width: 242,
                  height: 196,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 103,
                right: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/logo.png",
                            width: 14.0,
                            height: 14.0,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Variegata",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF94AF9F),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Create your account now",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Color(0xFF505050),
                        ),
                      ),
                      SizedBox(
                        height: 69,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Username",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 13, bottom: 33),
                        width: 350,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFBBD6B8)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFBBD6B8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: 'Enter your Full Name*',
                            hintStyle: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onChanged: (value) {
                            _name = value;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email Address",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 13, bottom: 33),
                        width: 350,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFBBD6B8)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFBBD6B8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: 'Enter your E-mail*',
                            hintStyle: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 13, bottom: 33),
                        width: 350,
                        height: 50,
                        child: TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xFFBBD6B8)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFBBD6B8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: Color(0xFF878787),
                                onPressed: (() {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                })),
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: 'Create your Password*',
                            hintStyle: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                      ),
                      RoundedButton(
                        btnText: 'Create Account',
                        onBtnPressed: () => createAccountPressed(),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(vertical: 20),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Divider(
                      //           color: Color(0xFF94AF9F),
                      //           thickness: 2,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding:
                      //         const EdgeInsets.symmetric(horizontal: 15),
                      //         child: Text(
                      //           "Or",
                      //           style: TextStyle(
                      //             color: Color(0xFF505050),
                      //             fontSize: 19,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Divider(
                      //           color: Color(0xFF94AF9F),
                      //           thickness: 2,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 18),
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(24),
                      //     border: Border.all(
                      //       color: Color(0xFFBBD6B8),
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         "assets/img/google-icon.png",
                      //         height: 22,
                      //         width: 22,
                      //         fit: BoxFit.fill,
                      //       ),
                      //       Text(
                      //         "Sign in with Google",
                      //         style: TextStyle(
                      //           color: Color(0xFF505050),
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       Icon(
                      //         Icons.arrow_forward_ios,
                      //         color: Color(0xFF94AF9F),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Color(0xFF505050),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                " Sign In",
                                style: TextStyle(
                                    color: Color(0xFF94AF9F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
