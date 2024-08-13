import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/style.dart';
import 'package:flutter_boilerplate_hng11/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/widgets/custom_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  compulsoryTitle(String title) {
    return RichText(
        text: TextSpan(
            style: GoogleFonts.inter(
              color: Color.fromRGBO(10, 10, 10, 1),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 20 / 14,
            ),
            children: [
          TextSpan(text: title),
          TextSpan(
              text: '*',
              style: TextStyle(color: Color.fromRGBO(220, 38, 38, 1)))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add a Product',
          style: DetailStyles.header,
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color.fromRGBO(222, 222, 222, 1),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 380.w,
            height: 715.h,
            margin: EdgeInsets.only(top: 17.h),
            child: Column(
              children: [
                Container(
                  width: 379.w,
                  height: 66.h,
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: compulsoryTitle('Title'),
                      ),
                      Container(
                          height: 40.h,
                          width: 379.w,
                          child: Text('product name textfield here'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 379.w,
                  height: 126.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: compulsoryTitle('Description'),
                      ),
                      Container(
                        height: 80.h,
                        width: 379.w,
                        child: Text('product description textfield here'),
                      ),
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: Text(
                          'Maximum of 72 characters',
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 20 / 14,
                              color: Color.fromRGBO(100, 116, 139, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 379.w,
                  height: 66.h,
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: Text(
                          'Category',
                          style: GoogleFonts.inter(
                            color: Color.fromRGBO(10, 10, 10, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 20 / 14,
                          ),
                        ),
                      ),
                      Container(
                          height: 40.h,
                          width: 379.w,
                          child: Text('Category dropdown here'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 379.w,
                  height: 66.h,
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: compulsoryTitle('Standard Price'),
                      ),
                      Container(
                          height: 40.h,
                          width: 379.w,
                          child: Text('Standard Price textfield here'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 379.w,
                  height: 66.h,
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: compulsoryTitle('Quantity'),
                      ),
                      Container(
                          height: 40.h,
                          width: 379.w,
                          child: Text('Quantity textfield here'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
