import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/password_textfield.dart';
import 'package:first_wtf_app/widgets/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
              textEditingController: emailController,
            ),
            SizedBox(height: 16),
            PasswordTextfield(textEditingController: passwordController),
            SizedBox(height: 16),
            CustomButton(
              text: "Login",
              onPressed: () {
                // check email
                // if it is not valid return and show message
                // check password
                // if it is not valid return and show message
                // else take user to the next page
                if (emailController.text != "anto@gmail.com") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not a valid email. Try again")),
                  );

                  return;
                }

                if (passwordController.text != "23456") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not a valid passord Try again")),
                  );

                  // showDialog(context: context, builder: (context){
                  //   return AlertDialog(
                  //     content: Text("Not a valid passord Try again"),
                  //     actions: [],
                  //   );
                  // });

                  return;
                }

                Navigator.of(context).pushReplacementNamed("/home");
              },
            ),
            SizedBox(height: 24),

            SocialSignIn(),

            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/signup");
                  },
                  child: Text("Sign up", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
