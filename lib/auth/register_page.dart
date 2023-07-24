import 'package:flutter/material.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/common/widget/bottom_navbar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureText1 = true;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: currentHeight * 1.2,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  // top: 0,
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
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirm your Password",
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
                            obscureText: _obscureText1,
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
                                  icon: Icon(_obscureText1
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: Color(0xFF878787),
                                  onPressed: (() {
                                    setState(() {
                                      _obscureText1 = !_obscureText1;
                                    });
                                  })),
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: 'Confirm your Password*',
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
                        Container(
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
                        Container(
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
                                  Navigator.push(
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
      ),
    );
  }
}
