import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key, required this.onCategorySelected});
  final Function(String) onCategorySelected;
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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(203, 213, 225, 1), width: 1),
          borderRadius: BorderRadius.circular(6)),
      // unable to reuse created customdropdown, it is overflowing with error
      child: DropdownButton<String>(
        padding: const EdgeInsets.only(left: 8),
        dropdownColor: GlobalColors.deemWhiteColor,
        hint: const Text('Select'),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 30,
        isExpanded: true,
        underline: const SizedBox(),
        style: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          color: const Color.fromRGBO(10, 10, 10, 1),
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
