import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/loading_overlay.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/screens/app_product/provider/add_product_provider.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/add_product_formfields.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/product_category.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/product_images.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';

import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/global_colors.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final nameController = TextEditingController();
  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  final productQuantityController = TextEditingController();

  String? selectedCategory;
  List<PlatformFile> selectedFiles = [];

  void onFilesSelected(List<PlatformFile> files) {
    setState(() {
      selectedFiles = files;
    });
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();

    super.dispose();
  }

  compulsoryTitle(String title) {
    return RichText(
      text: TextSpan(
        style: CustomTextStyle.medium(
          color: GlobalColors.dark2,
          fontSize: 12.sp,
        ),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: '*',
            style: CustomTextStyle.medium(
              color: GlobalColors.hotred,
              fontSize: 14.sp,
            ),
          )
        ],
      ),
    );
  }

  void resetForm() {
    formKey.currentState!.reset();
    setState(() {
      // FilePicker.();
    });
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Future<void> addProduct() async {
    if (!formKey.currentState!.validate() ||
        selectedFiles.isEmpty ||
        selectedCategory == null) {
      showEmptyStateSnackbar();
      return;
    }

    String? base64Image;
    if (selectedFiles.isNotEmpty) {
      final file = File(selectedFiles.first.path!);
      final bytes = await file.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    Map<String, dynamic> productData = {
      'name': productNameController.text,
      'description': productDescriptionController.text,
      'price': productPriceController.text,
      'quantity': productQuantityController.text,
      'category': selectedCategory ?? '',
      'image_url': base64Image,
    };

    ref.read(addProductProviderProvider.notifier).addProduct(
          data: productData,
          onError: () {
            failedSnackBar('An Error occured');
          },
          onSuccess: () {
            showSuccessDialog();
            productNameController.clear();
            productDescriptionController.clear();
            productPriceController.clear();
            productQuantityController.clear();
            resetForm();
            context.pop();
          },
        );
  }

  void failedSnackBar(Object e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to add product: $e'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showEmptyStateSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please Complete form fill'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Product added successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addProductProviderProvider);
    return LoadingOverlay(
      isLoading: state.isLoading,
      child: Scaffold(
        appBar: CustomAppBar.simpleTitle(
          titleText: context.addAProduct,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: 355.w,
                    margin: EdgeInsets.only(top: 17.h),
                    child: Column(
                      children: [
                        ProductImage(getProductFiles: onFilesSelected),
                        SizedBox(
                          height: 6.h,
                        ),
                        SizedBox(
                          width: 379.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              compulsoryTitle('Title'),
                              6.h.sbH,
                              ProductNameFormField(
                                controller: productNameController,
                              )
                              // Container(
                              //   height: 40.h,
                              //   width: 379.w,
                              //   child: const Text('Product textfield here'),
                              // )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 379.w,
                              child: Text(
                                'Category',
                                style: CustomTextStyle.medium(
                                  color: GlobalColors.dark2,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            6.h.sbH,
                            SizedBox(
                              height: 40.h,
                              width: 379.w,
                              // child: const Text(
                              //   'Category dropdown here',
                              // ),
                              child: ProductCategory(
                                onCategorySelected: onCategorySelected,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        SizedBox(
                          width: 379.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 379.w,
                                child: Text(
                                  'Description',
                                  style: CustomTextStyle.medium(
                                    color: GlobalColors.dark2,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              6.h.sbH,

                              DescriptionFormField(
                                controller: productDescriptionController,
                              ),
                              // Container(
                              //   height: 80.h,
                              //   width: 379.w,
                              //   child: const Text('description textfield here'),
                              // ),
                              SizedBox(
                                width: 379.w,
                                child: Text(
                                  'Maximum of 72 characters',
                                  style: CustomTextStyle.medium(
                                    color: GlobalColors.lightGrey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 379.w,
                              child: compulsoryTitle('Standard Price'),
                            ),
                            6.h.sbH,
                            ProductPriceFormField(
                              controller: productPriceController,
                            ),
                            // Container(
                            //   height: 40.h,
                            //   width: 379.w,
                            //   child: const Text(
                            //     'Standard Price textfield here',
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 379.w,
                              child: compulsoryTitle('Quantity'),
                            ),
                            6.h.sbH,

                            ProductQuantityFormField(
                              controller: productQuantityController,
                            )
                            // Container(
                            //   height: 40.h,
                            //   width: 379.w,
                            //   child: const Text('Quantity textfield here'),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        // SizedBox(
                        //   width: 379.w,
                        //   height: 93.h,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       SizedBox(
                        //         height: 20.h,
                        //         width: 379.w,
                        //         child: compulsoryTitle('Product Variations'),
                        //       ),
                        // ProductVariation(
                        //   getProductList: (List<PlatformFile> files) {},
                        // ),
                        // Container(
                        //   height: 67.h,
                        //   width: 368.w,
                        //   child: const Text(
                        //       'Product Variations container list here'),
                        // ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 28.h,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 355.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: state.isLoading
                                ? () {}
                                : () {
                                    context.pop();
                                  },
                            borderColor: GlobalColors.lightGray,
                            text: 'Cancel',
                            height: 40.h,
                            containerColor: GlobalColors.white,
                            width: 172.5.w,
                            textColor: GlobalColors.darkTwo,
                          ),
                        ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        12.w.sbW,
                        Expanded(
                          child: CustomButton(
                            onTap: state.isLoading ? () {} : addProduct,
                            // () {},
                            borderColor: GlobalColors.white,
                            text: 'Add',
                            loading: state.isLoading,
                            height: 40.h,
                            containerColor: GlobalColors.orange,
                            width: 172.5.w,
                            textColor: GlobalColors.zinc50,
                          ),
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
      ),
    );
  }
}
