import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/localization/strings.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanySignUpScreen extends ConsumerWidget {
  CompanySignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _companyNameController = TextEditingController();

  final _companyEmailController = TextEditingController();

  final _companyIndustryController = TextEditingController();

  final _companyTypeController = TextEditingController();

  final _companyCountryController = TextEditingController();

  final _companyStateController = TextEditingController();

  final _companyAddressController = TextEditingController();

  final _companyLgaController = TextEditingController();

  final loadingProvider = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(loadingProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   leading: Icon(
        //     Icons.chevron_left_rounded,
        //     size: 30.sp,
        //   ),
        //   backgroundColor: Colors.white,
        //   // surfaceTintColor: Colors.white,
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.9,
              width: 350.w,
              padding: EdgeInsets.symmetric(vertical: 20.h),
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
                            StringManager.signUp,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            StringManager.createAnAccount,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          CustomTextField(
                            label: StringManager.companyName,
                            controller: _companyNameController,
                            hintText: StringManager.enterCompanyName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringManager.pleaseEnterName;
                              }

                              return null;
                            },
                            labelStyle: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          CustomTextField(
                            label: StringManager.companyEmail,
                            controller: _companyEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: StringManager.enterCompanyEmail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringManager.pleaseEnterValidEmail;
                              }

                              return null;
                            },
                            labelStyle: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            StringManager.selectIndustry,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.agricultureIndustry,
                              StringManager.developmentIndustry,
                            ],
                            onChanged: (String? value) {
                              _companyIndustryController.text = value ?? '';
                            },
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: Colors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            StringManager.organizationType,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.agricultureIndustry,
                              StringManager.developmentIndustry,
                            ],
                            onChanged: (String? value) {
                              _companyTypeController.text = value ?? '';
                            },
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: Colors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                        ],
                      ),
                    ),
                    // Basic Sign Up Section Ends Here
                    SizedBox(height: 30.sp),
                    // Company Address Section Starts Here
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringManager.companyAddress,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            StringManager.selectCountry,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.agricultureIndustry,
                              StringManager.developmentIndustry,
                            ],
                            onChanged: (String? value) {
                              _companyCountryController.text = value ?? '';
                            },
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: Colors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            StringManager.selectState,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.agricultureIndustry,
                              StringManager.developmentIndustry,
                            ],
                            onChanged: (String? value) {
                              _companyStateController.text = value ?? '';
                            },
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: Colors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          CustomTextField(
                            label: StringManager.address,
                            controller: _companyAddressController,
                            hintText: StringManager.enterCompanyAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringManager.pleaseEnterValidAddress;
                              }

                              return null;
                            },
                            labelStyle: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            StringManager.lga,
                            style: TextStyle(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.agricultureIndustry,
                              StringManager.developmentIndustry,
                            ],
                            onChanged: (String? value) {
                              _companyLgaController.text = value ?? '';
                            },
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: Colors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                        ],
                      ),
                    ),
                    // Company Address Section Ends Here
                    SizedBox(height: 30.sp),
                    // Action Button Section Starts Here
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            onTap: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                ref.read(loadingProvider.notifier).state = true;
                                //Submission async function here
                                ref.read(loadingProvider.notifier).state =
                                    false;
                              }
                            },
                            loading: isLoading,
                            borderColor: GlobalColors.orange,
                            text: StringManager.createAccount,
                            height: 40.sp,
                            containerColor: GlobalColors.orange,
                            width: double.infinity,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 20.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringManager.alreadyHaveAnAccount,
                                style: TextStyle(
                                  color: GlobalColors.darkOne,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 10.sp),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  StringManager.login,
                                  style: TextStyle(
                                    color: GlobalColors.orange,
                                    fontSize: 13.sp,
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
      ),
    );
  }
}
