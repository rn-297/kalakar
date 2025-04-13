import 'dart:async';
import 'dart:io';

// import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/file_controller.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:pdfx/pdfx.dart';
import 'package:video_player/video_player.dart';
import '../../helper/route_helper.dart';

class ViewFilePage extends StatefulWidget {
  const ViewFilePage({Key? key}) : super(key: key);

  @override
  State<ViewFilePage> createState() => _ViewFilePageState();
}

class _ViewFilePageState extends State<ViewFilePage> {
  RxString fileType = ''.obs;
  RxString filePath = ''.obs;
  RxString appBarText = ''.obs;

  RxBool isInitialized = false.obs;

  int count = 0;
  late PdfControllerPinch pdfController;
  late CachedVideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    // setState(() {
    checkFileType();
    super.initState();
  }

  @override
  void dispose() {
    try {
      _customVideoPlayerController.dispose();
    } catch (e) {
      // print(e);
    }
    try {
      pdfController.dispose();
    } catch (e) {
      // print(e);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: AppBar(
          backgroundColor: KalakarColors.appBarBackground,
          title: Text(appBarText.value),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Obx(() => fileType.value != ""
                ? Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: fileType.value == "PDF"
                        ? PdfViewPinch(
                            controller: pdfController,
                            onDocumentError: (e) {
                              // print(e);
                            },
                            onDocumentLoaded: (val) {
                              // print(val);
                            },
                            scrollDirection: Axis.vertical,
                          )
                        : fileType.value == "VIDEO"
                            ? isInitialized.value
                                ? AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CustomVideoPlayer(
                                      customVideoPlayerController:
                                          _customVideoPlayerController,
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator())
                            : Center(
                                child: AspectRatio(
                                    aspectRatio: 10 / 16,
                                    child: filePath.value.startsWith("http")
                                        ? Image.network(filePath.value)
                                        : Image.file(File(filePath.value))),
                              ),
                  )
                : Container()),
          ),
        ],
      ),
    );
  }

  Future<void> setVideoData(String filePath) async {
    print("object");
    FileController fileController = Get.put(FileController());
    final String _localFilePath = fileController.filePath;
    print(fileController.filePath);

    try {
      videoPlayerController =
          CachedVideoPlayerController.network(_localFilePath)
            ..initialize().then((value) => setState(() {
                  isInitialized.value = true;
                }));
      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
      );
      setState(() {
        // print("Done");
      });
    } catch (e) {
      // print(e);
    }
    setState(() {
      // print("1Object");
    });
  }

  Future<void> checkFileType() async {
    FileController fileController = Get.put(FileController());

    appBarText.value = fileController.appBarName;
    filePath.value = fileController.filePath;

    // print("set pdf image video");

    fileType.refresh();

    fileType.value = fileController.fileType;
    print(fileType.value);
    try {
      // });
      // print(folderController.fileViewPath.lengthSync());
      // print("fileType${fileType.value} ${folderController.fileViewPath.path}");
      print(fileType.value);
      if (fileType.value == "PDF") {
        if (count == 0) {
          pdfController = PdfControllerPinch(
              document: PdfDocument.openFile(fileController.filePath));

          count++;
        } else {
          // await pdfController.document.then((value) => value.close());
          pdfController
              .loadDocument(PdfDocument.openFile(fileController.filePath));
        }
        Timer(const Duration(milliseconds: 100), () {
          setState(() {
            fileType.refresh();
          });
        });
        // pdfController.document =
        //     PdfDocument.openFile(folderController.fileViewPath.path);
      } else if (fileType.value == 'VIDEO') {
        setVideoData(fileController.filePath);
      } else {}
    } catch (e) {
      // print(e);
    }

    // print(fileType.value);
    fileType.refresh();
  }
}
