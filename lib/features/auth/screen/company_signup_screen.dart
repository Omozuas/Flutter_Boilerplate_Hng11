import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button_form_field.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import localization
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';

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
    final localizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalColors.white,
        appBar: CustomAppBar.simpleTitle(
          showDivider: false,
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
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizations.editOrganization,
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            localizations.createAnAccount,
                            style: CustomTextStyle.regular(
                              color: GlobalColors.gray500Color,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          CustomTextField(
                            label: localizations.companyName,
                            controller: _companyNameController,
                            hintText: localizations.enterCompanyName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return localizations.pleaseEnterName;
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
                            label: localizations.companyEmail,
                            controller: _companyEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: localizations.enterCompanyEmail,
                            validator: (value) {
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                              if (value == null ||
                                  value.isEmpty ||
                                  !emailRegex.hasMatch(value)) {
                                return localizations.pleaseEnterValidEmail;
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
                            localizations.selectIndustry,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButtonFormField(
                            items: [
                              localizations.agricultureIndustry,
                              localizations.manufacturingIndustry,
                              localizations.technologyIndustry,
                              localizations.healthcareIndustry,
                              localizations.educationIndustry,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.selectIsRequired;
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              _companyIndustryController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            containerColor: GlobalColors.white,
                            textPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            localizations.organizationType,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButtonFormField(
                            items: [
                              localizations.soleProprietorship,
                              localizations.partnership,
                              localizations.corporation,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.selectIsRequired;
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              _companyTypeController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            containerColor: GlobalColors.white,
                            textPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            textColor: GlobalColors.darkOne,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.sp),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizations.companyAddress,
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            localizations.selectCountry,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButtonFormField(
                            items: [
                              localizations.country1,
                              localizations.country2,
                              localizations.country3,
                              localizations.country4,
                              localizations.country5,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.selectIsRequired;
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              _companyCountryController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            containerColor: GlobalColors.white,
                            textPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            localizations.selectState,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButtonFormField(
                            items: [
                              localizations.state1,
                              localizations.state2,
                              localizations.state3,
                              localizations.state4,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.selectIsRequired;
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              _companyStateController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            textPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            containerColor: GlobalColors.white,
                            textColor: GlobalColors.darkOne,
                          ),
                          SizedBox(height: 25.sp),
                          CustomTextField(
                            label: localizations.address,
                            controller: _companyAddressController,
                            hintText: localizations.enterCompanyAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return localizations.pleaseEnterValidAddress;
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
                            localizations.lga,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButtonFormField(
                            items: [
                              localizations.lga1,
                              localizations.lga2,
                              localizations.lga3,
                              localizations.lga4,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.selectIsRequired;
                              }
                              return null;
                            },
                            onChanged: (String? value) {
                              _companyLgaController.text = value ?? '';
                            },
                            valueStyle: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                            borderColor: GlobalColors.lightGray,
                            containerColor: GlobalColors.white,
                            textPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            textColor: GlobalColors.darkOne,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.sp),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomButton(
                            onTap: () async {
                              if (_companyFormKey.currentState!.validate()) {
                                ref.read(loadingProvider.notifier).state = true;
                                // Submission async function here
                                ref.read(loadingProvider.notifier).state =
                                    false;
                              }
                            },
                            loading: isLoading,
                            borderColor: GlobalColors.orange,
                            text: localizations.createAccount,
                            height: 40.sp,
                            containerColor: GlobalColors.orange,
                            width: double.infinity,
                            textColor: GlobalColors.white,
                          ),
                          SizedBox(height: 20.sp),
                        ],
                      ),
                    ),
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
