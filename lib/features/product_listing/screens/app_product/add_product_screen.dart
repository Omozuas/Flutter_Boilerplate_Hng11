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

  // Controllers for form fields
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController = TextEditingController();

  String? selectedCategory;
  List<PlatformFile> selectedFiles = [];

  // Handles file selection and updates state
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

  // Displays a title with an asterisk to indicate a required field
  Widget compulsoryTitle(String title) {
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
          ),
        ],
      ),
    );
  }

  // Resets the form fields and state
  void resetForm() {
    formKey.currentState?.reset();
    setState(() {
      selectedFiles.clear();
      selectedCategory = null;
    });
  }

  // Updates the selected category
  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // Handles adding the product after validation
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
            failedSnackBar(context.anErrorOccured);
          },
          onSuccess: () {
            showSuccessDialog();
            resetForm();
            context.pop();
          },
        );
  }

  // Displays a snackbar for failed operations
  void failedSnackBar(Object e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${context.addProductFailure}: $e'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Displays a snackbar when form submission is incomplete
  void showEmptyStateSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.productFormIncomplete),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Shows a success dialog upon successful product addition
  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.success),
          content: Text(context.addProductSuccessDescription),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(context.ok),
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
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 379.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              compulsoryTitle(context.title),
                              8.h.sbH,
                              ProductNameFormField(
                                controller: productNameController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            compulsoryTitle(context.category),
                            8.h.sbH,
                            SizedBox(
                              height: 40.h,
                              width: 379.w,
                              child: ProductCategory(
                                onCategorySelected: onCategorySelected,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 379.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              compulsoryTitle(context.description),
                              8.h.sbH,
                              DescriptionFormField(
                                controller: productDescriptionController,
                              ),
                              SizedBox(
                                width: 379.w,
                                child: Text(
                                  context.descriptionFieldHint,
                                  style: CustomTextStyle.medium(
                                    color: GlobalColors.lightGrey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            compulsoryTitle(context.standardPrice),
                            8.h.sbH,
                            ProductPriceFormField(
                              controller: productPriceController,
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            compulsoryTitle(context.quantity),
                            8.h.sbH,
                            ProductQuantityFormField(
                              controller: productQuantityController,
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
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
                            onTap: state.isLoading ? () {} : () => context.pop(),
                            borderColor: GlobalColors.lightGray,
                            text: context.cancel,
                            height: 40.h,
                            containerColor: GlobalColors.white,
                            width: 172.5.w,
                            textColor: GlobalColors.darkTwo,
                          ),
                        ),
                        12.w.sbW,
                        Expanded(
                          child: CustomButton(
                            onTap: state.isLoading ? () {} : addProduct,
                            borderColor: GlobalColors.white,
                            text: context.add,
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
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
