// Added image to the custom list tile widget
// Added black and white color constants
// Added images to assets folder
// Implement regular user signup UI only

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_list_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';

import '../utils/globalColors/global_colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SettingsTile(
          leadingIcon: Icons.menu,
          image: Image.asset(
            'assets/images/hng-boilerplate-Logo.png',
            height: 25,
          ),
          title: '',
          onTap: () {},
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: GlobalColors.lightGray,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Sign up',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Create an account to get started with us.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            // Google signup button
            SizedBox(height: 30.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              onPressed: () {},
              icon: Image.asset(
                'assets/images/g.png',
                height: 25,
              ),
              label: Text('Sign Up With Google'),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Or'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            // Input fields
            SizedBox(
              height: 10.0,
            ),
            CustomTextField(
                label: 'First Name',
                controller: firstNameController,
                hintText: 'Enter your first name'),
            CustomTextField(
                label: 'Last Name',
                controller: lastNameController,
                hintText: 'Enter your last name'),
            CustomTextField(
                label: 'Email',
                controller: emailController,
                hintText: 'Enter your email'),
            CustomTextField(
                label: 'Password',
                controller: passwordController,
                hintText: 'Create your password'),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: GlobalColors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
              onPressed: () {},
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 16.0, color: GlobalColors.white),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already Have An Account? ',
                  style: TextStyle(color: GlobalColors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(color: GlobalColors.orange),
                      // Add an onTap function to navigate to the login screen
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
