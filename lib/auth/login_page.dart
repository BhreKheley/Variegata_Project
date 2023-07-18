import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:variegata_project/auth/register_page.dart';
import 'package:variegata_project/common/widget/bottom_navbar.dart';
import 'package:variegata_project/main.dart';
import 'package:variegata_project/pages/profile_page.dart';

import '../pages/dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  horizontalMode() {}

  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: currentHeight * .925,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  // top: 0,
                  child: Image.asset(
                    "assets/img/vector-login.png",
                    height: 196,
                    width: 148,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 93,
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
                          "Sign in to your account",
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
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF505050),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        //email
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
                              hintText: 'Example396@gmail.com',
                              hintStyle: TextStyle(
                                color: Color(0xFF878787),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF505050),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        //password
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
                              hintText: 'example78650',
                              hintStyle: TextStyle(color: Color(0xFF878787)),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BotNavbar(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 34),
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFE2EFE1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 34),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFF94AF9F),
                                  thickness: 2,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Or",
                                  style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color(0xFF94AF9F),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            margin: EdgeInsets.only(bottom: 100),
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Color(0xFFBBD6B8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/google-icon.png",
                                  height: 22,
                                  width: 22,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                    color: Color(0xFF505050),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF94AF9F),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                  color: Color(0xFF505050),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  " Create",
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
      ),
    );
  }
}
