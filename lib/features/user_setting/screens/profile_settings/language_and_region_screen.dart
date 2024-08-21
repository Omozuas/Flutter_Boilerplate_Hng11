import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/localization/strings.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/widgets/custom_dropdown_button.dart';

class LanguageAndRegionScreen extends StatefulWidget {
  const LanguageAndRegionScreen({super.key});

  @override
  State<LanguageAndRegionScreen> createState() =>
      _LanguageAndRegionScreenState();
}

class _LanguageAndRegionScreenState extends State<LanguageAndRegionScreen> {
  String? selectedLanguage;
  String? selectedRegion;
  String? selectedTimeZone;
  String? feedBackMessage;
  bool showError = false;
  Color feedBackMessageColor = Colors.transparent;
  void validateSelections() {
    setState(() {
      showError = selectedLanguage == null ||
          selectedRegion == null ||
          selectedTimeZone == null;

      if (!showError) {
        feedBackMessage = StringManager.settingsSavedSuccessfully;
        feedBackMessageColor = GlobalColors.greenColor;
      } else {
        feedBackMessage = null;
      }
    });
  }

  void unsavedChanges() {
    if (selectedLanguage != null ||
        selectedRegion != null ||
        selectedTimeZone != null && feedBackMessage == null) {
      setState(() {
        feedBackMessage =
            StringManager.unsavedChangesWarning;
        feedBackMessageColor = GlobalColors.lightOrangeColor;
      });
    } else {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      appBar: AppBar(
        backgroundColor: GlobalColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        titleSpacing: -6.sp,
        leading: GestureDetector(
          onTap: () {
            ///tODO: Perform onTap function for this icon
          },
          child: const Icon(Icons.chevron_left),
        ),
        title: Text(
         StringManager.languageAndRegion,
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             StringManager.customizeLanguageAndRegionPreferences,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400, fontSize: 12.sp),
            ),
            SizedBox(height: 20.h),
            CustomDropdownButton(
              items: const [
                'Italiano (Italian)',
                'Español (Spanish)',
                'Français (French)',
                'Deutsch (German)',
                'English',
                '日本語 (Japanese)',
                '한국어 (Korean)',
                'Русский (Russian)',
                'العربية (Arabic)'
              ],
              borderColor: GlobalColors.borderColor,
              height: 36.sp,
              width: double.infinity,
              containerColor: GlobalColors.whiteColor,
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
               StringManager.languageUpdateError,
                style: TextStyle(color: GlobalColors.redColor, fontSize: 12.sp),
              ),
            SizedBox(height: 10.h),
            CustomDropdownButton(
              items: const [
                'France',
                'Canada',
                'United Kingdom',
                'Germany',
                'United States',
                'Japan',
                'South Korea',
                'Russian',
                'United Arab Emirates'
              ],
              borderColor: GlobalColors.borderColor,
              height: 36.sp,
              width: double.infinity,
              containerColor: GlobalColors.whiteColor,
              textColor: GlobalColors.darkOne,
              placeholder: 'Region',
              onChanged: (value) {
                setState(() {
                  selectedRegion = value;
                });
              },
            ),
            if (showError && selectedRegion == null)
              Text(
               StringManager.regionUpdateError,
                style: TextStyle(color: GlobalColors.redColor, fontSize: 12.sp),
              ),
            SizedBox(height: 10.h),
            CustomDropdownButton(
              items: const [
                '(UTC+00:00) Co-ord',
                '(UTC-05:00) Eastern Time (US & Canada)',
                '(UTC+01:00) Central European Time',
                // Add other time zones here
              ],
              borderColor: GlobalColors.borderColor,
              height: 36.sp,
              width: double.infinity,
              containerColor: GlobalColors.whiteColor,
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
              StringManager.timezoneUpdateError,
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
                    borderColor: Colors.transparent,
                    text: StringManager.save,
                    height: 40.sp,
                    containerColor: GlobalColors.orange,
                    width: 65.sp,
                    textColor: GlobalColors.whiteColor),
                SizedBox(width: 10.h),
                CustomButton(
                    onTap: unsavedChanges,
                    borderColor: GlobalColors.borderColor,
                    text: StringManager.cancel,
                    height: 40.sp,
                    containerColor: GlobalColors.whiteColor,
                    width: 65.sp,
                    textColor: GlobalColors.darkOne),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
