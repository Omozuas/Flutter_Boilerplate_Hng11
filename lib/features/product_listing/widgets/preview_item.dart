import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PreviewItem extends StatelessWidget {
  final PlatformFile previewFile;
  final VoidCallback removeItem;

  const PreviewItem({
    super.key,
    required this.previewFile,
    required this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.file(
              File(previewFile.xFile.path),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: removeItem,
                child: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.red.shade300,
                  size: 20,
                ),
              )),
        ],
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
            ".${previewFile.extension!}",
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: removeItem,
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
