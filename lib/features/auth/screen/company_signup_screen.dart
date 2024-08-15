import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CompanySignUpScreen extends ConsumerWidget {
  CompanySignUpScreen({super.key});

  final _companyFormKey = GlobalKey<FormState>();

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
        backgroundColor: GlobalColors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30.sp,
            ),
          ),
          backgroundColor: GlobalColors.white,
          // surfaceTintColor: GlobalColors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 350.w,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              color: GlobalColors.white,
              child: Form(
                key: _companyFormKey,
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
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            'Create an account to get started with us.',
                            style: CustomTextStyle.regular(
                              color: GlobalColors.gray500Color,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          CustomTextField(
                            label: 'Company\'s Name',
                            controller: _companyNameController,
                            hintText: 'Enter company\'s name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }

                              return null;
                            },
                            labelStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            hintTextStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          CustomTextField(
                            label: 'Company\'s Email Address',
                            controller: _companyEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Enter company\'s email address',
                            validator: (value) {
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                              if (value == null || value.isEmpty) {
                                return 'Please enter email address';
                              }
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            labelStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            hintTextStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            'Select Industry',
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              'Agriculture',
                              'Manufacturing',
                              'Technology',
                              'Healthcare',
                              'Education',
                            ],
                            onChanged: (String? value) {
                              _companyIndustryController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: GlobalColors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            'Organization Type',
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              'Sole Proprietorship',
                              'Partnership',
                              'Corporation',
                            ],
                            onChanged: (String? value) {
                              _companyTypeController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: GlobalColors.white,
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
                            'Company Address',
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            'Select country',
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              'Germany',
                              'Nigeria',
                              'Canada',
                              'Brazil',
                              'Japan',
                            ],
                            onChanged: (String? value) {
                              _companyCountryController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: GlobalColors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            'Select state',
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              'Lagos',
                              'Florida',
                              'Texas',
                              'California',
                            ],
                            onChanged: (String? value) {
                              _companyStateController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: GlobalColors.white,
                            width: double.infinity,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          CustomTextField(
                            label: 'Address',
                            controller: _companyAddressController,
                            hintText: 'Enter company address',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid address';
                              }

                              return null;
                            },
                            labelStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            hintTextStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            'LGA',
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              'Ikeja',
                              'Brisbane City',
                              'City of Sydney',
                              'Ibadan North',
                            ],
                            onChanged: (String? value) {
                              _companyLgaController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            height: 48,
                            containerColor: GlobalColors.white,
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
                              if (_companyFormKey.currentState!.validate()) {
                                ref.read(loadingProvider.notifier).state = true;
                                //Submission async function here
                                ref.read(loadingProvider.notifier).state =
                                    false;
                              }
                            },
                            loading: isLoading,
                            borderColor: GlobalColors.orange,
                            text: 'Create Account',
                            height: 40.sp,
                            containerColor: GlobalColors.orange,
                            width: double.infinity,
                            textColor: GlobalColors.white,
                          ),
                          SizedBox(height: 20.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Have An Account?',
                                style: CustomTextStyle.regular(
                                  color: GlobalColors.darkOne,
                                  fontSize: 13.sp,
                                ),
                              ),
                              SizedBox(width: 10.sp),
                              GestureDetector(
                                onTap: () {
                                  context.push(AppRoute.login);
                                },
                                child: Text(
                                  'Login',
                                  style: CustomTextStyle.regular(
                                    color: GlobalColors.orange,
                                    fontSize: 13.sp,
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
