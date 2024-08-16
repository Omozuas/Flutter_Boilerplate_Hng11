import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/global_colors.dart';

class ImagePreview extends StatefulWidget {
  final Function(PlatformFile file) addFileToList;
  final Function(PlatformFile file) removeFileFromList;

  const ImagePreview(
      {super.key,
      required this.addFileToList,
      required this.removeFileFromList});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  FilePickerResult? result = const FilePickerResult([]);

  void pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.media,
      );

      widget.addFileToList(result!.files.first);

      setState(() {});
    } catch (e) {
      // print(e);
    }
  }

  void removeFile(PlatformFile file) async {
    setState(() {
      result?.files.remove(file);
    });
    widget.removeFileFromList(file);
  }

  @override
  Widget build(BuildContext context) {
    return result!.files.isEmpty
        ? GestureDetector(
            onTap: () {
              pickFile();
            },
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
              height: 67.h,
              width: 83.w,
              child: Icon(
                Icons.add,
                size: 18.sp,
                color: GlobalColors.darkOne,
              ),
            ),
          )
        : previewFile();
  }

  Widget previewFile() {
    try {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.file(
                File(result!.files[0].xFile.path),
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 1,
                right: 1,
                child: GestureDetector(
                  onTap: () {
                    removeFile(result!.files[0]);
                  },
                  child: Icon(
                    Icons.remove_circle_outline_outlined,
                    color: Colors.red.shade300,
                    size: 20,
                  ),
                )),
          ],
        ),
      );
    } catch (e) {
      return Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            ".${result!.files.first.extension!}",
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
            top: 1,
            right: 1,
            child: GestureDetector(
              onTap: () {
                removeFile(result!.files[0]);
              },
              child: Icon(
                Icons.remove_circle_outline_outlined,
                color: Colors.red.shade300,
                size: 20,
              ),
            )),
      ]);
    }
  }
}
