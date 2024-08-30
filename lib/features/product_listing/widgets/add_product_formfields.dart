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
<<<<<<< HEAD
<<<<<<< HEAD
            return 'Description is required';
=======
            return AppLocalizations.of(context)!.descriptionPlaceholder;
>>>>>>> dev
=======
            return AppLocalizations.of(context)!.productDescriptionPlaceholder;
>>>>>>> 63ce5556642ea90c04a89994d26f4419d9caf4d9
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
    return SizedBox(
      child: CustomTextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
<<<<<<< HEAD
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d{1,3}(,\d{3})*(\.\d{0,2})?$'),
          ),
          CommaTextInputFormatter(),
        ],
        borderColor: GlobalColors.containerBorderColor,
        hintText: '\$ 0.00',
=======
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          DecimalTextInputFormatter(decimalRange: 2),
        ],
        borderColor: GlobalColors.containerBorderColor,
        hintText: '0.00',
        prefixIcon: Icon(
          Icons.attach_money,
          size: 25.r,
        ),
>>>>>>> dev
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }

<<<<<<< HEAD
          String sanitizedValue = value.replaceAll(',', '');

          try {
            double parsedValue = double.parse(sanitizedValue);
=======
          try {
            double parsedValue = double.parse(value);
>>>>>>> dev

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

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    text = text.replaceAll(',', '');

    bool hasDecimal = text.contains('.');

    List<String> parts = text.split('.');

    if (parts[0].length > 3) {
      parts[0] = parts[0].replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    }

    text = hasDecimal ? parts.join('.') : parts[0];

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class ProductQuantityFormField extends StatelessWidget {
  const ProductQuantityFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomTextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
<<<<<<< HEAD
          FilteringTextInputFormatter.digitsOnly,
        ],
        borderColor: GlobalColors.containerBorderColor,
        hintText: '0 pcs',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.productQuantityPlaceholder;
          }
          try {
            int parsedValue = int.parse(value);
            if (parsedValue <= 0) {
              return 'Please enter a quantity greater than 0';
            }
          } catch (e) {
            return 'Please enter a valid quantity';
          }
          return null;
        },
      ),
    );
  }
}

class ProductCategoryFormField extends StatelessWidget {
  const ProductCategoryFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomTextField(
        controller: controller,
        borderColor: GlobalColors.containerBorderColor,
        hintText: 'Enter category',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Category is required';
=======
          FilteringTextInputFormatter.allow(RegExp(r'^\d*')),
        ],
        borderColor: GlobalColors.containerBorderColor,
        hintText: '2 pcs',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.productQuantityPlaceholder;
>>>>>>> dev
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
