// import 'dart:html' as html;
//
// import 'dart:ui_web';
//
// import 'package:flutter/material.dart';
//
// class BlobVideoPlayer extends StatelessWidget {
//   final String blobUrl;
//
//   BlobVideoPlayer({required this.blobUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     // Unique view ID
//     final viewID = 'videoElement-${blobUrl.hashCode}';
//
//     // Register the video element
//     platformViewRegistry.registerViewFactory(viewID, (int _) {
//       final video = html.VideoElement()
//         ..src = blobUrl
//         ..controls = true
//         ..autoplay = true
//         ..style.width = '100%'
//         ..style.height = '100%';
//       return video;
//     });
//
//     return HtmlElementView(viewType: viewID);
//   }
// }
