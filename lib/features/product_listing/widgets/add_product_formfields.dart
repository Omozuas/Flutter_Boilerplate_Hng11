import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/global_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? borderColor;
  final double? borderRadius;
  final bool showCounter;

  const CustomTextField({
    super.key,
    this.hintText,
    this.hintTextStyle,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.borderColor,
    this.borderRadius,
    this.suffixIcon,
    this.showCounter = true,
    this.onChanged,
    this.prefixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IntrinsicHeight(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
                  borderSide: BorderSide(
                    color: GlobalColors.containerBorderColor,
                    width: 1.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
                  borderSide: BorderSide(
                    color: borderColor ?? GlobalColors.borderColor,
                    width: 1.w,
                  ),
                ),
                counterText: showCounter ? null : '',
                hintStyle: CustomTextStyle.regular(
                  color: GlobalColors.lightGrey,
                  fontSize: 14.sp,
                ),
                contentPadding: const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  right: 12,
                  bottom: 10,
                ),
                prefixIcon: prefixIcon,
                alignLabelWithHint: true,
              ),
              keyboardType: keyboardType,
              validator: validator,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              maxLines: maxLines,
              expands: maxLines == null,
              textAlignVertical: TextAlignVertical.top,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductNameFormField extends StatelessWidget {
  const ProductNameFormField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    // final productNameController = TextEditingController();

    return SizedBox(
      child: CustomTextField(
        controller: controller,
        borderColor: GlobalColors.containerBorderColor,
        hintText: AppLocalizations.of(context)!.productNameLabel,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.productNamePlaceholder;
          }
          return null;
        },
      ),
    );
  }
}

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    // final productDescriptionController = TextEditingController();
    return SizedBox(
      height: 80.h,
      width: 379.w,
      child: CustomTextField(
        controller: controller,
        maxLength: 72,
        maxLines: 8,
        borderColor: GlobalColors.containerBorderColor,
        hintText: AppLocalizations.of(context)!.productDescriptionPlaceholder,
        showCounter: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.descriptionPlaceholder;
          }
          return null;
        },
      ),
    );
  }
}

class ProductPriceFormField extends StatelessWidget {
  const ProductPriceFormField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    // final productPriceController = TextEditingController();
    return SizedBox(
      child: CustomTextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          DecimalTextInputFormatter(decimalRange: 2),
        ],
        borderColor: GlobalColors.containerBorderColor,
        hintText: '0.00',
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.attach_money,
            //size: 20,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }

          try {
            double parsedValue = double.parse(value);

            if (parsedValue <= 0) {
              return 'Please enter a value greater than 0';
            }
          } catch (e) {
            return 'Please enter a valid number';
          }

          return null;
        },
      ),
    );
  }
}

class ProductQuantityFormField extends StatelessWidget {
  const ProductQuantityFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // final productQuantityController = TextEditingController();
    return SizedBox(
      child: CustomTextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*')),
        ],
        borderColor: GlobalColors.containerBorderColor,
        hintText: '2 pcs',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.productQuantityPlaceholder;
          }
          return null;
        },
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange >= 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (text == '') {
      return newValue;
    }

    // Only allow a single decimal point
    if (text.contains('.') && text.split('.').length > 2) {
      return oldValue;
    }

    // Limit the number of decimal places
    if (text.contains('.') &&
        text.substring(text.indexOf('.') + 1).length > decimalRange) {
      return oldValue;
    }

    // Ensure the value is a valid double
    try {
      double.parse(text);
    } catch (e) {
      return oldValue;
    }

    return newValue;
  }
}
