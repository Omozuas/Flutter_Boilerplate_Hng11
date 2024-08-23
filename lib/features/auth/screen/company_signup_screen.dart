import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate_hng11/l10n/app_localizations.dart'; // Import the localization

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
                            AppLocalizations.of(context)!.signUp,
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.createAccountMessage,
                            style: CustomTextStyle.regular(
                              color: GlobalColors.gray500Color,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          CustomTextField(
                            label: AppLocalizations.of(context)!.companyName,
                            controller: _companyNameController,
                            hintText: AppLocalizations.of(context)!.enterCompanyName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterName;
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
                            label: AppLocalizations.of(context)!.companyEmailAddress,
                            controller: _companyEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: AppLocalizations.of(context)!.enterCompanyEmail,
                            validator: (value) {
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterEmail;
                              }
                              if (!emailRegex.hasMatch(value)) {
                                return AppLocalizations.of(context)!.pleaseEnterValidEmail;
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
                            AppLocalizations.of(context)!.selectIndustry,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: [
                              AppLocalizations.of(context)!.agriculture,
                              AppLocalizations.of(context)!.manufacturing,
                              AppLocalizations.of(context)!.technology,
                              AppLocalizations.of(context)!.healthcare,
                              AppLocalizations.of(context)!.education,
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
                            AppLocalizations.of(context)!.organizationType,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: [
                              AppLocalizations.of(context)!.soleProprietorship,
                              AppLocalizations.of(context)!.partnership,
                              AppLocalizations.of(context)!.corporation,
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
                    
                    SizedBox(height: 30.sp),
                  
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.companyAddress,
                            style: CustomTextStyle.semiBold(
                              color: GlobalColors.darkOne,
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            AppLocalizations.of(context)!.selectCountry,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: [
                              AppLocalizations.of(context)!.germany,
                              AppLocalizations.of(context)!.nigeria,
                              AppLocalizations.of(context)!.canada,
                              AppLocalizations.of(context)!.brazil,
                              AppLocalizations.of(context)!.japan,
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
                            AppLocalizations.of(context)!.selectState,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkOne,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          CustomDropdownButton(
                            items: [
                              AppLocalizations.of(context)!.lagos,
                              AppLocalizations.of(context)!.florida,
                              AppLocalizations.of(context)!.texas,
                              AppLocalizations.of(context)!.california,
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
                            label: AppLocalizations.of(context)!.address,
                            controller: _companyAddressController,
                            hintText: AppLocalizations.of(context)!.enterCompanyAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterValidAddress;
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
                            label: AppLocalizations.of(context)!.lga,
                            controller: _companyLgaController,
                            hintText: AppLocalizations.of(context)!.enterLGA,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterValidLGA;
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
                        ],
                      ),
                    ),
                  
                    SizedBox(height: 35.sp),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        height: 50.h,
                        color: GlobalColors.primaryGreen,
                        isLoading: isLoading,
                        onTap: () async {
                          if (_companyFormKey.currentState?.validate() ?? false) {
                            ref.read(loadingProvider.notifier).state = true;
                            await Future.delayed(const Duration(seconds: 2));
                            ref.read(loadingProvider.notifier).state = false;

                            if (context.mounted) {
                              context.go(AppRouter.companyDetailsRoute);
                            }
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.continueText,
                          style: CustomTextStyle.medium(
                            color: GlobalColors.white,
                            fontSize: 15.sp,
                          ),
                        ),
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
