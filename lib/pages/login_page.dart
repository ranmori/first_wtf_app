import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Been a while",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            CustomTextField(
              label: "Email",
            ),
            SizedBox(height: 16),
            PasswordTextfield(),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55), //width, height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Login"),
            ),
            SizedBox(height: 24),
            Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Divider()), 
                Text("Sign up with"), 
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                InkWell(onTap: (){},child: Image.asset("assets/google.png",width: 50, height: 50,)),
                InkWell(onTap: (){},child: Image.asset("assets/fb.png",width: 50, height: 50,)),
                InkWell(onTap: (){},child: Image.asset("assets/x.png",width: 50, height: 50,)),
              ],
            ),
            SizedBox(height: 36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed("/signup");
                  },
                  child: Text("Sign up", style: TextStyle(color: Colors.blue),)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
