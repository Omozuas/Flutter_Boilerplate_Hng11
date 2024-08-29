import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/custom_text_style.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({
    super.key,
    required this.onCategorySelected,
    this.validator,
  });
  final Function(String) onCategorySelected;
  final String? Function(String?)? validator;
  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  String? selectedCategory;
  final List<String> categoryItems = [
    'Electronics & Gadgets',
    'Fashion & Apparel',
    'Home & Living',
    'Health & Beauty',
    'Sports & Outdoors',
    'Books & Media',
    'Groceries & Essentials',
    'Toys & Games',
    'Automotive & Tools',
    'Furniture & Decor',
    'Food',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // unable to reuse created customdropdown, it is overflowing with error
      child: DropdownButtonFormField<String>(
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(
              color: GlobalColors.borderColor,
              width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(
              color: GlobalColors.orange,
              width: 1.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(
              color: GlobalColors.red,
              width: 1.w,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(
              color: GlobalColors.borderColor,
              width: 1.w,
            ),
          ),
        ),
        dropdownColor: GlobalColors.deemWhiteColor,
        hint: Text(AppLocalizations.of(context)!.select),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: GlobalColors.dark2,
        ),
        iconSize: 20.r,
        isExpanded: true,
        style: CustomTextStyle.medium(
          color: GlobalColors.dark2,
          fontSize: 14.sp,
        ),
        value: selectedCategory,
        onChanged: (newValue) {
          setState(() {
            selectedCategory = newValue;
            widget.onCategorySelected(newValue!);
          });
        },
        items: categoryItems.map((String valueItem) {
          return DropdownMenuItem<String>(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }
}
