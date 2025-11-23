import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/password_textfield.dart';
import '../widgets/custom_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // ---- Profile Picture ----
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // ---- Name ----
            CustomTextField(label: "Full Name"),

            SizedBox(height: 16),

            // ---- Email ----
            CustomTextField(label: "Email Address"),

            SizedBox(height: 16),

            // ---- Password ----
            PasswordTextfield(),

            SizedBox(height: 32),

            // ---- Save Button ----
            CustomButton(
              text: "Save Changes",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
