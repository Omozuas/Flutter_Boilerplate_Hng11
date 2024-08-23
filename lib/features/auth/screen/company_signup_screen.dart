import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/localiza/strings.dart';
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
          leading: const ChevronBackButton(),
          backgroundColor: Colors.white,
          // surfaceTintColor: Colors.white,
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
                            StringManager.editOrganization,
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            StringManager.createAnAccount,
                            style: CustomTextStyle.regular(
                              color: GlobalColors.gray500Color,
                              fontSize: 13.sp,
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
                            label: StringManager.companyEmail,
                            controller: _companyEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: StringManager.enterCompanyEmail,
                            validator: (value) {
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                              if (value == null || value.isEmpty) {
                                return StringManager.pleaseEnterValidEmail;
                              }
                              if (!emailRegex.hasMatch(value)) {
                                return StringManager.pleaseEnterValidEmail;
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
                            StringManager.selectIndustry,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.agricultureIndustry,
                              StringManager.manufacturingIndustry,
                              StringManager.technologyIndustry,
                              StringManager.healthcareIndustry,
                              StringManager.educationIndustry,
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
                            StringManager.organizationType,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.soleProprietorship,
                              StringManager.partnership,
                              StringManager.corporation,
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
                            StringManager.companyAddress,
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            StringManager.selectCountry,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.country1,
                              StringManager.country2,
                              StringManager.country3,
                              StringManager.country4,
                              StringManager.country5,
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
                            StringManager.selectState,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.state1,
                              StringManager.state2,
                              StringManager.state3,
                              StringManager.state4,
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
                            label: StringManager.address,
                            controller: _companyAddressController,
                            hintText: StringManager.enterCompanyAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringManager.pleaseEnterValidAddress;
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
                            StringManager.lga,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: const [
                              StringManager.lga1,
                              StringManager.lga2,
                              StringManager.lga3,
                              StringManager.lga4,
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
                            text: StringManager.createAccount,
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
                                StringManager.alreadyHaveAnAccount,
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
                                  StringManager.login,
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
