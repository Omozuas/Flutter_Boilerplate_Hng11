import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/global_colors.dart';
import '../../../../utils/widgets/custom_dropdown_button.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton(
      items: [
        'item 1',
        'item 2',
        'item 3',
        'item 4',
      ],

      borderColor: Color(0xFFCBD5E1),
      height: 17.sp,
      width: double.infinity,
      //width: 323.w,
      containerColor: Color(0xFFFFFFFF),
      textColor: GlobalColors.darkOne,
      placeholder: 'Language',

      // onChanged: (value) {
      //   setState(() {
      //     selectedLanguage = value;
      //   });
      // },

      //textColor: Color(0xFF525252),
      initialValue: 'Select',
    );
  }
}
