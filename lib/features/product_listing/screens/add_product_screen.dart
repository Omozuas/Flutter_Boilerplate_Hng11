import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/components/formfields.dart';
import '../widgets/components/product_category.dart';
import '../widgets/components/product_variation.dart';
import '../widgets/product_images.dart';

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
              color: const Color.fromRGBO(10, 10, 10, 1),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 20 / 14,
            ),
            children: [
          TextSpan(text: title),
          const TextSpan(
              text: '*',
              style: TextStyle(color: Color.fromRGBO(220, 38, 38, 1)))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Future<void> addProduct() async {
      if (!_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Complete form fill'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: Text(
          'Add a Product',
          style: GoogleFonts.inter(
            color: const Color.fromRGBO(10, 10, 10, 1),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 24 / 14,
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromRGBO(222, 222, 222, 1),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  width: 355.w,
                  // height: 715.h,
                  margin: EdgeInsets.only(top: 17.h),
                  child: Column(
                    children: [
                      ProductImages(getProductFiles: (files) {
                        // Add functionality to submit
                      }),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        width: 379.w,
                        height: 66.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            compulsoryTitle('Title'),
                            const ProductNameFormField()
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
                              child: Text(
                                'Description',
                                style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(10, 10, 10, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 14 / 14,
                                ),
                              ),
                            ),
                            DescriptionFormField(),
                            Container(
                              height: 20.h,
                              width: 379.w,
                              child: Text(
                                'Maximum of 72 characters',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 20 / 14,
                                  color: const Color.fromRGBO(100, 116, 139, 1),
                                ),
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
                                  color: const Color.fromRGBO(10, 10, 10, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 20 / 14,
                                ),
                              ),
                            ),
                            Container(
                              height: 40.h,
                              width: 379.w,
                              // child: const Text(
                              //   'Category dropdown here',
                              // ),
                              child: ProductCategory(),
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
                            ProductPriceFormField(),
                            // Container(
                            //   height: 40.h,
                            //   width: 379.w,
                            //   child: const Text(
                            //     'Standard Price textfield here',
                            //   ),
                            // )
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
                            ProductQuantityFormField()
                            // Container(
                            //   height: 40.h,
                            //   width: 379.w,
                            //   child: const Text('Quantity textfield here'),
                            // )
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
                            ProductVariation(
                              getProductList: (List<PlatformFile> files) {},
                            ),
                            // Container(
                            //   height: 67.h,
                            //   width: 368.w,
                            //   child: const Text(
                            //       'Product Variations container list here'),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 355.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onTap: () {},
                        borderColor: const Color.fromRGBO(226, 232, 240, 1),
                        text: 'Cancel',
                        height: 40.h,
                        containerColor: const Color.fromRGBO(255, 255, 255, 1),
                        width: 172.5.w,
                        textColor: const Color.fromRGBO(15, 23, 42, 1),
                      ),
                      // SizedBox(
                      //   width: 10.w,
                      // ),
                      CustomButton(
                        onTap: addProduct,
                        // () {},
                        borderColor: const Color.fromRGBO(226, 232, 240, 1),
                        text: 'Add',
                        height: 40.h,
                        containerColor: const Color.fromRGBO(249, 115, 22, 1),
                        width: 172.5.w,
                        textColor: const Color.fromRGBO(250, 250, 250, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
