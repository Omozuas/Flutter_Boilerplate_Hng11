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
import 'package:lottie/lottie.dart';

import '../../../../utils/global_colors.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();

  late final AnimationController _animationController;

  String? selectedCategory;
  List<PlatformFile> selectedFiles = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }

  void onFilesSelected(List<PlatformFile> files) {
    setState(() {
      selectedFiles = files;
    });
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void resetForm() {
    formKey.currentState!.reset();
    setState(() {
      selectedFiles.clear();
      selectedCategory = null;
    });
  }

  Future<void> addProduct() async {
    if (!formKey.currentState!.validate() ||
        selectedFiles.isEmpty ||
        selectedCategory == null) {
      showValidationError();
      return;
    }

    String? base64Image;
    if (selectedFiles.isNotEmpty) {
      final file = File(selectedFiles.first.path!);
      final bytes = await file.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    final Map<String, dynamic> productData = {
      'name': productNameController.text,
      'description': productDescriptionController.text,
      'price': productPriceController.text,
      'quantity': productQuantityController.text,
      'category': selectedCategory!,
      'image_url': base64Image,
    };

    ref.read(addProductProviderProvider.notifier).addProduct(
      data: productData,
      onError: () => showFailureSnackBar(context.addProductFailure),
      onSuccess: () {
        showSuccessDialog();
        resetForm();
        context.pop();
      },
    );
  }

  void showValidationError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.productFormIncomplete),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showFailureSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$errorMessage: ${context.anErrorOccured}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
                Navigator.of(context).pop();
              },
              child: Text(context.ok),
            ),
          ],
        );
      },
    );
  }

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
          )
        ],
      ),
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
                  Center(
                    child: Lottie.asset(
                      '/home/user/Flutter_Boilerplate_Hng11/assets/animation/empty.json',
                      controller: _animationController,
                      height: 250.h,
                      width: 250.w,
                      fit: BoxFit.cover,
                      repeat: true,
                    ),
                  ),
                  Container(
                    width: 355.w,
                    margin: EdgeInsets.only(top: 17.h),
                    child: Column(
                      children: [
                        ProductImage(getProductFiles: onFilesSelected),
                        SizedBox(height: 12.h),
                        _buildFormFields(),
                        SizedBox(height: 50.h),
                        _buildActionButtons(state),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildProductNameField(),
        SizedBox(height: 12.h),
        _buildCategoryField(),
        SizedBox(height: 12.h),
        _buildDescriptionField(),
        SizedBox(height: 12.h),
        _buildPriceField(),
        SizedBox(height: 12.h),
        _buildQuantityField(),
      ],
    );
  }

  Widget _buildProductNameField() {
    return SizedBox(
      width: 379.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          compulsoryTitle(context.title),
          8.h.sbH,
          ProductNameFormField(controller: productNameController),
        ],
      ),
    );
  }

  Widget _buildCategoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        compulsoryTitle(context.category),
        8.h.sbH,
        SizedBox(
          height: 40.h,
          width: 379.w,
          child: ProductCategory(onCategorySelected: onCategorySelected),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return SizedBox(
      width: 379.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          compulsoryTitle(context.description),
          8.h.sbH,
          DescriptionFormField(controller: productDescriptionController),
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
    );
  }

  Widget _buildPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        compulsoryTitle(context.standardPrice),
        8.h.sbH,
        ProductPriceFormField(controller: productPriceController),
      ],
    );
  }

  Widget _buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        compulsoryTitle(context.quantity),
        8.h.sbH,
        ProductQuantityFormField(controller: productQuantityController),
      ],
    );
  }

  Widget _buildActionButtons(AddProductState state) {
    return SizedBox(
      height: 40.h,
      width: 355.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomButton(
              onTap: state.isLoading ? null : () => context.pop(),
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
              onTap: state.isLoading ? null : addProduct,
              text: context.addProduct,
              width: 172.5.w,
              height: 40.h,
              textColor: GlobalColors.white,
              containerColor: GlobalColors.primaryGreen,
              borderColor: GlobalColors.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}
