import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/widgets/custom_text_field.dart';
import '../widgets/breaking_border_container.dart';
import '../widgets/components/formfields.dart';

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

  FilePickerResult? result = const FilePickerResult([]);
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.media,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // print(e);
    }
  }

  void addFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      final newFile = await FilePicker.platform.pickFiles(
        type: FileType.media,
      );
      for (var file in newFile!.files) {
        result!.files.add(file);
      }
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // print(e);
    }
  }

  void removeFile(PlatformFile file) async {
    setState(() {
      result?.files.remove(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final productNameController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: Text(
          'Add a Product',
          style: GoogleFonts.inter(
            color: Color.fromRGBO(10, 10, 10, 1),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 24 / 14,
          ),
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
          child: Column(
            children: [
              Container(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          compulsoryTitle('Title'),
                          const ProductNameFormField()
                          // Container(
                          //   color: Colors.amber,
                          //   height: 40.h,
                          //   width: 379.w,
                          //   child: CustomTextField(
                          //     controller: productNameController,
                          //     borderColor: Color.fromRGBO(203, 213, 225, 1),
                          //     hintText: 'Product name',
                          //   ),
                          // ),
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
                              child: Text(
                                  'Product Variations container list here'))
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
                                color: Color.fromRGBO(239, 239, 239, 1.0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: result!.files.isEmpty
                                  ? Center(
                                      child: SizedBox(
                                        height: 58.h,
                                        width: 250.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                pickFile();
                                              },
                                              child: Container(
                                                height: 32.h,
                                                width: 114.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            const Color.fromRGBO(
                                                                226,
                                                                232,
                                                                240,
                                                                1)),
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    boxShadow: const [
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
                                                      color: Color.fromRGBO(
                                                          10, 10, 10, 1),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 24 / 14,
                                                    ),
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
                                                  'Accepts images, videos or 3D models',
                                                  style: GoogleFonts.inter(
                                                    color: Color.fromRGBO(
                                                        82, 82, 82, 1),
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: 16.94 / 14,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              mainAxisSpacing: 4.0,
                                              crossAxisSpacing: 4.0),
                                      // physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.all(8.h),
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return GestureDetector(
                                            onTap: () {
                                              addFile();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Colors.white),
                                              child: const Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        }

                                        return previewItem(
                                          previewFile: result!.files[index - 1],
                                        );
                                      },
                                      itemCount: result!.files.length + 1,
                                    ),
                            ),
                          )
                        ],
                      ),
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
                      containerColor: Color.fromRGBO(255, 255, 255, 1),
                      width: 172.5.w,
                      textColor: Color.fromRGBO(15, 23, 42, 1),
                    ),
                    CustomButton(
                      onTap: () {},
                      borderColor: Color.fromRGBO(226, 232, 240, 1),
                      text: 'Add',
                      height: 40.h,
                      containerColor: Color.fromRGBO(249, 115, 22, 1),
                      width: 172.5.w,
                      textColor: Color.fromRGBO(250, 250, 250, 1),
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
    );
  }

  Widget previewItem({required PlatformFile previewFile}) {
    try {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.file(
              File(previewFile.xFile.path),
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 1,
              right: 1,
              child: GestureDetector(
                onTap: () {
                  removeFile(previewFile);
                },
                child: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.red.shade300,
                  size: 20,
                ),
              ))
        ],
      );
    } catch (e) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
        child: const Icon(
          Icons.play_circle_outline_outlined,
          color: Colors.grey,
        ),
      );
    }
  }
}
