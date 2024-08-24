import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/widgets/custom_dropdown_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../auth/providers/language_provider.dart';

class LanguageAndRegionScreen extends ConsumerStatefulWidget {
  const LanguageAndRegionScreen({super.key});

  @override
  ConsumerState<LanguageAndRegionScreen> createState() =>
      _LanguageAndRegionScreenState();
}

class _LanguageAndRegionScreenState
    extends ConsumerState<LanguageAndRegionScreen> {
  String? selectedLanguage;
  String? selectedRegion;
  String? selectedTimeZone;
  String? feedBackMessage;
  bool showError = false;
  Color feedBackMessageColor = Colors.transparent;

  void validateSelections() {
    setState(() {
      showError = selectedLanguage == null ||
          // selectedRegion == null ||
          selectedTimeZone == null;

      if (!showError) {
        feedBackMessage = context.text.settings;
        ref
            .read(languageProvider.notifier)
            .setLanguage(getLanguageCode(selectedLanguage!));
        feedBackMessageColor = GlobalColors.green;
      } else {
        feedBackMessage = null;
      }
    });
  }

  void unsavedChanges() {
    if (selectedLanguage != null ||
        // selectedRegion != null ||
        selectedTimeZone != null && feedBackMessage == null) {
      setState(() {
        feedBackMessage = AppLocalizations.of(context)!.unsavedChangesWarning;
        feedBackMessageColor = GlobalColors.lightOrangeColor;
      });
    } else {
      //
    }
  }

  String getLanguageCode(String language) {
    switch (language) {
      case 'Español (Spanish)':
        return 'es';
      case 'Italiano (Italian)':
        return 'it';
      case 'Français (French)':
        return 'fr';
      case 'Deutsch (German)':
        return 'de';
      case '日本語 (Japanese)':
        return 'ja';
      case '日本語 (Chinese)':
        return 'zh';
      case '한국어 (Korean)':
        return 'ko';
      case 'Русский (Russian)':
        return 'ru';
      case 'العربية (Arabic)':
        return 'ar';
      case 'English':
      default:
        return 'en';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.white,
      appBar: CustomAppBar.simpleTitle(
        titleText: AppLocalizations.of(context)!.languageAndRegion,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Text(
              AppLocalizations.of(context)!
                  .customizeLanguageAndRegionPreferences,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
            SizedBox(height: 30.h),
            CustomDropdownButton(
              items: const [
                // 'Italiano (Italian)',
                'Español (Spanish)',
                // 'Français (French)',
                // 'Deutsch (German)',
                'English',
                // '日本語 (Japanese)',
                '日本語 (Chinese)',
                // '한국어 (Korean)',
                // 'Русский (Russian)',
                // 'العربية (Arabic)'
              ],
              borderColor: GlobalColors.borderColor,
              height: 50.h,
              textPadding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              width: double.infinity,
              containerColor: GlobalColors.white,
              textColor: GlobalColors.darkOne,
              placeholder: 'Language',
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value;
                });
              },
            ),
            if (showError && selectedLanguage == null)
              Text(
                AppLocalizations.of(context)!.languageUpdateError,
                style: TextStyle(color: GlobalColors.redColor, fontSize: 12.sp),
              ),
            // SizedBox(height: 20.h),
            // CustomDropdownButton(
            //   items: const [
            //     'France',
            //     'Canada',
            //     'United Kingdom',
            //     'Germany',
            //     'United States',
            //     'Japan',
            //     'South Korea',
            //     'Russian',
            //     'United Arab Emirates'
            //   ],
            //   borderColor: GlobalColors.borderColor,
            //   height: 50.h,
            //   textPadding: const EdgeInsets.only(
            //       left: 10, right: 10, bottom: 10, top: 10),
            //   width: double.infinity,
            //   containerColor: GlobalColors.white,
            //   textColor: GlobalColors.darkOne,
            //   placeholder: 'Region',
            //   onChanged: (value) {
            //     setState(() {
            //       selectedRegion = value;
            //     });
            //   },
            // ),

            if (showError && selectedRegion == null)
              Text(
                AppLocalizations.of(context)!.regionUpdateError,
                style: TextStyle(color: GlobalColors.redColor, fontSize: 12.sp),
              ),
            SizedBox(height: 20.h),
            CustomDropdownButton(
              items: const [
                '(UTC+00:00) Co-ord',
                '(UTC-05:00) Eastern Time (US & Canada)',
                '(UTC+01:00) Central European Time',
                // Add other time zones here
              ],
              borderColor: GlobalColors.borderColor,
              height: 50.h,
              textPadding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              width: double.infinity,
              containerColor: GlobalColors.white,
              textColor: GlobalColors.darkOne,
              placeholder: 'Time-Zone',
              onChanged: (value) {
                setState(() {
                  selectedTimeZone = value;
                });
              },
            ),
            if (showError && selectedTimeZone == null)
              Text(
                AppLocalizations.of(context)!.timezoneUpdateError,
                style: TextStyle(color: GlobalColors.redColor, fontSize: 12.sp),
              ),
            SizedBox(height: 10.h),
            Text(
              feedBackMessage ?? '',
              style: TextStyle(color: feedBackMessageColor),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    onTap: validateSelections,
                    borderColor: GlobalColors.orange,
                    text: AppLocalizations.of(context)!.save,
                    // height: 40.h,
                    containerColor: GlobalColors.orange,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // width: 80.w,
                    textColor: GlobalColors.white),
                SizedBox(width: 10.h),
                CustomButton(
                    onTap: unsavedChanges,
                    borderColor: GlobalColors.borderColor,
                    text: AppLocalizations.of(context)!.cancel,
                    // height: 40.h,
                    containerColor: GlobalColors.white,
                    // width: 80.w,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    textColor: GlobalColors.darkOne),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
