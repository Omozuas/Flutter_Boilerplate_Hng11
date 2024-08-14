import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
// unable to reuse Judah customtextfield

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final int? maxLength;
  final Color? borderColor;

  CustomTextField({
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      validator: validator,
      maxLength: maxLength,
    );
  }
}

class ProductNameFormField extends StatelessWidget {
  const ProductNameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final productNameController = TextEditingController();
    return Container(
      height: 40.h,
      width: 379.w,
      child: CustomTextField(
        controller: productNameController,
        borderColor: Color.fromRGBO(203, 213, 225, 1),
        hintText: 'Product name',
      ),
    );
  }
}

//  Container(
//                             height: 40.h,
//                             width: 379.w,
//                             child: Text('product name textfield here'),
//                           ),