import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/globalColors/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
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
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Basic Sign Up Section Starts Here
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
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: 'Company\'s Email Address',
                        controller: _companyNameController,
                        hintText: 'Enter company\'s email address',
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Select Industry',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomDropdownButton(
                        items: const [
                          'Agriculture',
                          'Devlopment',
                        ],
                        borderColor: GlobalColors.lightGray,
                        height: 50,
                        containerColor: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Organization Type',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomDropdownButton(
                        items: const [
                          'Agriculture',
                          'Devlopment',
                        ],
                        borderColor: GlobalColors.lightGray,
                        height: 50,
                        containerColor: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                // Basic Sign Up Section Ends Here
                const SizedBox(height: 30),
                // Company Address Section Starts Here
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company Address',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Select country',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomDropdownButton(
                        items: const [
                          'Agriculture',
                          'Devlopment',
                        ],
                        borderColor: GlobalColors.lightGray,
                        height: 50,
                        containerColor: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Select state',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomDropdownButton(
                        items: const [
                          'Agriculture',
                          'Devlopment',
                        ],
                        borderColor: GlobalColors.lightGray,
                        height: 50,
                        containerColor: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        label: 'Address',
                        controller: _companyNameController,
                        hintText: 'Enter company\'s email address',
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'LGA',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomDropdownButton(
                        items: const [
                          'Agriculture',
                          'Devlopment',
                        ],
                        borderColor: GlobalColors.lightGray,
                        height: 50,
                        containerColor: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                // Company Address Section Ends Here
                const SizedBox(height: 30),
                // Action Button Section Starts Here
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custombutton(
                        onTap: () {},
                        borderColor: GlobalColors.orang,
                        text: 'Create Account',
                        height: 40,
                        containerColor: GlobalColors.orang,
                        width: double.infinity,
                        textColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Have An Account?',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Login',
                              style: GoogleFonts.inter(
                                color: GlobalColors.orang,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // Action Button Section Ends Here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
