import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> pickImageFromGallery(BuildContext context) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    String? croppedImage = "";
    if (file != null) {
      croppedImage = await cropMyImage(file, context) ?? "";
    }
    return File(croppedImage) ;
  }

  static Future<File?> pickImageFromCamera(BuildContext context) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 600, maxHeight: 600);
    String? croppedImage = "";
    if (file != null) {
      croppedImage = await cropMyImage(file, context) ?? "";
    }
    return File(croppedImage);
  }

  static Future<String?> cropMyImage(
      XFile imageFile, BuildContext context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarColor: RenderErrorBox.backgroundColor,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    return croppedFile?.path;
  }

  static void showBottomSheet(BuildContext context, controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: Get.size.width,
          padding: EdgeInsets.all(16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Image",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  controller.getImageFromCamera(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Camera",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.getImageFromGallery();
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Gallery",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }
}
