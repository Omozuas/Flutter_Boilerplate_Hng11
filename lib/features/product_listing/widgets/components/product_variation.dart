// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../breaking_border_container.dart';
// import '../image_preview.dart';

// class ProductVariation extends StatefulWidget {
//   final Function(List<PlatformFile> files) getProductList;

//   const ProductVariation(
//       {super.key, this.itemCount = 4, required this.getProductList});

//   final int itemCount;

//   @override
//   State<ProductVariation> createState() => _ProductVariationState();
// }

// class _ProductVariationState extends State<ProductVariation> {
//   final List<PlatformFile> files = [];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 67.h,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: widget.itemCount,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 right: 12.0.w, top: 1.w, left: 1.w, bottom: 1.w),
//             child: GestureDetector(
//               onTap: () {
//                 //add fxn to pick and add image functionality
//               },
//               child: BreakingBorderContainer(
//                 child: ImagePreview(
//                   addFileToList: (file) {
//                     files.add(file);
//                     widget.getProductList(files);
//                   },
//                   removeFileFromList: (file) {
//                     files.remove(file);
//                     widget.getProductList(files);
//                   },
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
