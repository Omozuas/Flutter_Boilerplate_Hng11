import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanySignupScreen extends StatefulWidget {
  const CompanySignupScreen({super.key});

  @override
  State<CompanySignupScreen> createState() => _CompanySignupScreenState();
}

class _CompanySignupScreenState extends State<CompanySignupScreen> {
  final _companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Create an account to get started with us.',
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'Company\'s Name',
                        controller: _companyNameController,
                        hintText: 'Enter company\'s name',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: 'Company\'s Email Address',
                        controller: _companyNameController,
                        hintText: 'Enter company\'s email address',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
