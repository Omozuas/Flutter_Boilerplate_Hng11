import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/global_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final Color? borderColor;
  final double? borderRadius;
  final bool showCounter;

  CustomTextField({
    this.hintText,
    this.hintTextStyle,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.borderColor,
    this.borderRadius,
    this.showCounter = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 213, 225, 1),
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
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF94A3B8),
        ),
        contentPadding: const EdgeInsets.only(
          left: 12, top: 12, right: 12, bottom: 10,
        ),
        alignLabelWithHint: true,
      ),
      keyboardType: keyboardType,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      expands: maxLines == null,
      textAlignVertical: TextAlignVertical.top,
    );
  }
}

class ProductNameFormField extends StatelessWidget {
  const ProductNameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final productNameController = TextEditingController();
    return Container(
      height: 40.h,
      width: 379.w,
      child: CustomTextField(
        controller: productNameController,
        borderColor: const Color.fromRGBO(203, 213, 225, 1),
        hintText: 'Product name',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a product name';
          }
          return null;
        },
      ),
    );
  }
}

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final productDescriptionController = TextEditingController();
    return Container(
      height: 80.h,
      width: 379.w,
      child: CustomTextField(
        controller: productDescriptionController,
        maxLength: 72,
        maxLines: null,
        borderColor: const Color.fromRGBO(203, 213, 225, 1),
        hintText: 'Enter product description',
        showCounter: false,
      ),
    );
  }
}

class ProductPriceFormField extends StatelessWidget {
  const ProductPriceFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final productPriceController = TextEditingController();
    return Container(
      height: 40.h,
      width: 379.w,
      child: CustomTextField(
        controller: productPriceController,
        keyboardType: TextInputType.number,
        borderColor: const Color.fromRGBO(203, 213, 225, 1),
        hintText: '0.00',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a price';
          }
          return null;
        },
      ),
    );
  }
}

class ProductQuantityFormField extends StatelessWidget {
  const ProductQuantityFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final productQuantityController = TextEditingController();
    return Container(
      height: 40.h,
      width: 379.w,
      child: CustomTextField(
        controller: productQuantityController,
        keyboardType: TextInputType.number,
        borderColor: const Color.fromRGBO(203, 213, 225, 1),
        hintText: '0.00 pcs',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the quantity of product';
          }
          return null;
        },
      ),
    );
  }
}
