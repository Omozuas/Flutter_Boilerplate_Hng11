import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/style.dart';
import 'package:flutter_boilerplate_hng11/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/widgets/custom_text_field.dart';
import 'breaking_border_container.dart';

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
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
            // color: Colors.red,
            width: 355.w,
            height: 715.h,
            margin: EdgeInsets.only(top: 17.h),
            child: Column(
              children: [
                Container(
                  width: 379.w,
                  height: 66.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Text(
                          'Category dropdown here',
                        ),
                      )
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: compulsoryTitle('Standard Price'),
                      ),
                      Container(
                        height: 40.h,
                        width: 379.w,
                        child: Text(
                          'Standard Price textfield here',
                        ),
                      )
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 379.w,
                  height: 93.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: compulsoryTitle('Product Variations'),
                      ),
                      Container(
                          height: 67.h,
                          width: 368.w,
                          child: Text('Product Variations container list here'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 379.w,
                  height: 151.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 379.w,
                        child: Text(
                          'Media',
                          style: GoogleFonts.inter(
                            color: Color.fromRGBO(10, 10, 10, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 20 / 14,
                          ),
                        ),
                      ),
                      BreakingBorderContainer(
                        child: Container(
                          height: 125.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Container(
                              height: 58.h,
                              width: 250.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 32.h,
                                      width: 114.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  226, 232, 240, 1)),
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  10, 57, 176, 0.12),
                                              offset: Offset(0, 1),
                                              blurRadius: 18,
                                              spreadRadius: 0,
                                            )
                                          ]),
                                      child: Center(
                                        child: Text(
                                          'Upload New',
                                          style: GoogleFonts.inter(
                                            color:
                                                Color.fromRGBO(10, 10, 10, 1),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 24 / 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Accepts images, videos or 3D models',
                                    style: GoogleFonts.inter(
                                      color: Color.fromRGBO(82, 82, 82, 1),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 16.94 / 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
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
