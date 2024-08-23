import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/preview_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/custom_text_style.dart';
import '../../../utils/global_colors.dart';
import 'breaking_border_container.dart';

class ProductImage extends StatefulWidget {
  final Function(List<PlatformFile> file) getProductFiles;

  const ProductImage({super.key, required this.getProductFiles});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  FilePickerResult? result = const FilePickerResult([]);

  void pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.media,
      );
      widget.getProductFiles(result!.files);

      setState(() {});
    } catch (e) {
      // print(e);
    }
  }

  void addFile() async {
    try {
      final newFile = await FilePicker.platform.pickFiles(
        type: FileType.media,
      );
      for (var file in newFile!.files) {
        result!.files.add(file);
        widget.getProductFiles(result!.files);
      }
      setState(() {});
    } catch (e) {
      // print(e);
    }
  }

  void removeFile(PlatformFile file) async {
    setState(() {
      result?.files.remove(file);
      widget.getProductFiles(result!.files);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BreakingBorderContainer(
      child: Container(
        height: 158.h,
        width: 379.w,
        decoration: BoxDecoration(
          color: GlobalColors.zinc50,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: result?.files.isEmpty ?? true
            ? InkWell(
                onTap: pickFile,
                child: SizedBox(
                  height: 58.h,
                  width: 250.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 32.h,
                        width: 114.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: GlobalColors.lightGray,
                              //const Color.fromRGBO(226, 232, 240, 1),
                            ),
                            color: GlobalColors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: GlobalColors.boxShadow,
                                offset: const Offset(0, 1),
                                blurRadius: 18,
                                spreadRadius: 0,
                              )
                            ]),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.uploadNewButton,
                            style: CustomTextStyle.medium(
                              color: GlobalColors.darkTwo,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                        width: 250.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Upload product Image',
                            style: CustomTextStyle.medium(
                              color: GlobalColors.grays,
                              fontSize: 14.sp,
                            ),
                            // GoogleFonts.inter(
                            //   color: const Color.fromRGBO(82, 82, 82, 1),
                            //   fontSize: 14.sp,
                            //   fontWeight: FontWeight.w400,
                            //   height: 16.94 / 14,
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    addFile();
                  },
                  child: result == null
                      ? const SizedBox()
                      : PreviewItem(
                          previewFile: result!.files.first,
                          removeItem: () {
                            if (result != null) {
                              removeFile(result!.files.first);
                            }
                          },
                        ),
                ),
              ),
      ),
    );
  }
}
