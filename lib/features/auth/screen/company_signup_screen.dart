import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _companyEmailController = TextEditingController();
  final _companyIndustryController = TextEditingController();
  final _companyTypeController = TextEditingController();
  final _companyCountryController = TextEditingController();
  final _companyStateController = TextEditingController();
  final _companyAddressController = TextEditingController();
  final _companyLgaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.chevron_left_rounded,
            size: 30,
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 28,
              horizontal: 20,
            ),
            color: Colors.white,
            child: Form(
              key: _formKey,
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
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Create an account to get started with us.',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 13,
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
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'Company\'s Email Address',
                          controller: _companyEmailController,
                          hintText: 'Enter company\'s email address',
                          labelStyle: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Select Industry',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropdownButton(
                          items: const [
                            'Agriculture',
                            'Development',
                          ],
                          onChanged: (String? value) {
                            _companyIndustryController.text = value ?? '';
                          },
                          borderColor: GlobalColors.lightGray,
                          height: 48,
                          containerColor: Colors.white,
                          width: double.infinity,
                          textColor: Colors.black,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Organization Type',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropdownButton(
                          items: const [
                            'Agriculture',
                            'Development',
                          ],
                          onChanged: (String? value) {
                            _companyTypeController.text = value ?? '';
                          },
                          borderColor: GlobalColors.lightGray,
                          height: 48,
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
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Select country',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropdownButton(
                          items: const [
                            'Agriculture',
                            'Development',
                          ],
                          onChanged: (String? value) {
                            _companyCountryController.text = value ?? '';
                          },
                          borderColor: GlobalColors.lightGray,
                          height: 48,
                          containerColor: Colors.white,
                          width: double.infinity,
                          textColor: Colors.black,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Select state',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropdownButton(
                          items: const [
                            'Agriculture',
                            'Development',
                          ],
                          onChanged: (String? value) {
                            _companyStateController.text = value ?? '';
                          },
                          borderColor: GlobalColors.lightGray,
                          height: 48,
                          containerColor: Colors.white,
                          width: double.infinity,
                          textColor: Colors.black,
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          label: 'Address',
                          controller: _companyAddressController,
                          hintText: 'Enter company address',
                          labelStyle: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'LGA',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropdownButton(
                          items: const [
                            'Agriculture',
                            'Development',
                          ],
                          onChanged: (String? value) {
                            _companyLgaController.text = value ?? '';
                          },
                          borderColor: GlobalColors.lightGray,
                          height: 48,
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
                          onTap: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              //Submission code here
                            }
                          },
                          borderColor: GlobalColors.orange,
                          text: 'Create Account',
                          height: 40,
                          containerColor: GlobalColors.orange,
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
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Login',
                                style: GoogleFonts.inter(
                                  color: GlobalColors.orange,
                                  fontSize: 13,
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
      ),
    );
  }
}
