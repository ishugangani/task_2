import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff406882),
          title: Text(
            "LET'S DO IT",
            style: GoogleFonts.quicksand(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color(0xff406882),
        body: Column(
          children: [
            Spacer(),
            TextField(
              controller: txtUser,
              decoration: InputDecoration(
                label: Text("Username"),
                labelStyle: GoogleFonts.quicksand(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: txtPass,
              decoration: InputDecoration(
                label: Text("Password"),
                labelStyle: GoogleFonts.quicksand(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Navigator.pushNamed(context,'home');
              },
              child: Text(
                "Submit",
                style: GoogleFonts.quicksand(),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text("Don't have an accout? Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
