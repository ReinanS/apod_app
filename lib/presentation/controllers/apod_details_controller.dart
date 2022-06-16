import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class ApodDetailsController {
  void downloadImage(String url, BuildContext context) async {
    try {
      String? imageId = await ImageDownloader.downloadImage(url);

      if (imageId == null) {
        return;
      }

      dowloadToGallery(context);
    } on PlatformException catch (error) {
      log(error.toString());
    }
  }

  void dowloadToGallery(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Downloaded to Gallery')),
    );
  }
}
