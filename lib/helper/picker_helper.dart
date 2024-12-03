import 'dart:io';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:kalakar/data/models/file_web_model.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:kalakar/utils/kalakar_constants.dart';

class PickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> pickImageFromGallery(BuildContext context) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    print("111 ${file!.readAsBytes()}");
    String? croppedImage = "";
    if (file != null) {
      croppedImage = await cropMyImage(file, context) ?? "";
      print("222 ${croppedImage}");
    }
    return File(croppedImage);
  }

  static Future<FileDataWeb?> pickImageFromGalleryWeb(
      BuildContext context) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    FileDataWeb? pickerData;
    if (file!=null) {
      pickerData= FileDataWeb(
              name: file!.name,
              path: file!.path,
          type: "IMAGE",

              extension: file!.name.split(".").last,
              imageData: await file.readAsBytes());
    }
    return pickerData;
  }

  static Future<File?> pickImageFromCamera(BuildContext context) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 800, maxHeight: 800);
    String? croppedImage = "";
    if (file != null) {
      croppedImage = await cropMyImage(file, context) ?? "";
    }
    return File(croppedImage);
  }

  static Future<File?> pickVideoFromGallery(BuildContext context) async {
    XFile? file = await _imagePicker.pickVideo(source: ImageSource.gallery);

    if (file != null) {
      return File(file.path);
    }
    return null;
  }

  static Future<FileDataWeb?> pickVideoFromGalleryWeb(BuildContext context) async {
    XFile? file = await _imagePicker.pickVideo(source: ImageSource.gallery);
    FileDataWeb? pickerData;
    if (file!=null) {
      print("file.name ${file.name}");
      pickerData= FileDataWeb(
          name: file.name,
          path: "file.path",
          type: "VIDEO",

          extension: file.name.split(".").last,
          imageData: await file.readAsBytes());
    }
    return pickerData;
  }

  static Future<File?> pickVideoFromCamera(BuildContext context) async {
    XFile? file = await _imagePicker.pickVideo(
      source: ImageSource.camera,
    );
    if (file != null) {
      return File(file.path);
    }
    return null;
  }

  static Future<File?> pickPdfFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowCompression: true,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = await File.fromRawPath(result.files.first.bytes!);
      // print("object");
      return File(result.paths[0]!);
    }
    return null;
  }

  static Future<FileDataWeb?> pickPdfFromGalleryWeb() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowCompression: true,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      FileDataWeb dataWeb = FileDataWeb(
          path: result.files.first.name!,
          name: result.files.first.name,
          type: "PDF",

          extension: result.files.first.name!.split(".").last,
          imageData: result.files.first.bytes!);
      return dataWeb;
    }
    return null;
  }

  static Future<String?> cropMyImage(
      XFile imageFile, BuildContext context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarColor: KalakarColors.appBarBackground,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Crop',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        WebUiSettings(
          context: context,
          presentStyle: WebPresentStyle.page,
        ),
      ],
    );
    return croppedFile?.path;
  }

  static void showImageBottomSheet(BuildContext context, controller) {
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
                  controller.getImageFromCamera(
                      context, KalakarConstants.camera);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text(KalakarConstants.camera,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.getImageFromCamera(
                      context, KalakarConstants.gallery);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text(KalakarConstants.gallery,
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

  static void showOrPickDocBottomSheet(
      String documentType, BuildContext context, controller) {
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
                "$documentType Document",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  controller.pickDocument(documentType, context, controller);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Change Document",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.showDocument(documentType);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Show Document",
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

  static void showVideoBottomSheet(BuildContext context, controller) {
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
                "Add Video",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  controller.getVideoFromCamera(context);
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
                  controller.getVideoFromGallery(context);
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

  static void showImageVideoBottomSheet(BuildContext context, controller) {
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
                "Add Photos And Videos",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  showImageBottomSheet(context, controller);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Add Photo",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Get.back();
                  showVideoBottomSheet(context, controller);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Add Video",
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

  static void showImageBottomSheetWeb(BuildContext context, controller) {
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
                style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  controller.getImageFromCamera(
                      context, KalakarConstants.camera);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text(KalakarConstants.camera,
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.getImageFromCamera(
                      context, KalakarConstants.gallery);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text(KalakarConstants.gallery,
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showOrPickDocBottomSheetWeb(
      String documentType, BuildContext context, controller) {
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
                "$documentType Document",
                style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  controller.pickDocumentWeb(documentType, context, controller);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Change Document",
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.showDocument(documentType);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Show Document",
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showVideoBottomSheetWeb(BuildContext context, controller) {
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
                "Add Video",
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  controller.getVideoFromCamera(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Camera",
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.getVideoFromGallery(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Gallery",
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showImageVideoBottomSheetWeb(BuildContext context, controller) {
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
                "Add Photos And Videos",
                style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  controller.getImageFromCamera(context, KalakarConstants.gallery);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Add Photo",
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Get.back();
                  controller.getVideoFromCamera(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    child: Text("Add Video",
                        style: TextStyle(
                          fontSize: 6.sp,
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }
}
