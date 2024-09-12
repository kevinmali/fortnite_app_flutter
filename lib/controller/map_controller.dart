import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../model/global/varibales.dart';

class MapController extends GetxController {
  double scale = 1.0;
  RxBool isLoading = false.obs;
  var views = 0.obs;
  var likes = 0.obs;
  Random random = Random();

  @override
  void onInit() {
    super.onInit();
    fetchRandomData('');
  }

  void fetchRandomData(String id) {
    views.value = Global.box.read('views') ?? 1275;
    likes.value = Global.box.read(id) ?? 500;
  }

  void incrementViews() {
    int viewsRandom = random.nextInt(100) + 50;
    Global.box.write('views', views.value + viewsRandom);
    views.value = Global.box.read('views') ?? 1275;
    update();
  }

  void incrementLikes(String id) {
    int randomIncrement = random.nextInt(50) + 1;
    Global.box.write(id, likes.value + randomIncrement);
    likes.value = Global.box.read(id) ?? 500;
    update();
  }

  // download images
  void saveNetworkImage(String skins) async {
    isLoading.value = true;
    try {
      var response = await Dio()
          .get(skins, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "hello");
      Get.snackbar(
        'Success',
        'Image downloaded successfully!',
        backgroundColor: Colors.white24,
      );
    } catch (e) {
      Text("Error downloading image: $e");

      Get.snackbar(
        'Error',
        'Failed to download image.',
        backgroundColor: Colors.white24,
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void shareImage(String imageUrl) async {
    isLoading.value = true;
    try {
      // Download the image
      var response = await Dio()
          .get(imageUrl, options: Options(responseType: ResponseType.bytes));
      final Uint8List bytes = Uint8List.fromList(response.data);

      // Save the image to a temporary directory
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/shared_image.png').create();
      file.writeAsBytesSync(bytes);

      // Share the image
      await Share.shareFiles([file.path], text: "Check out this image!");

      Get.snackbar(
        'Success',
        'Image shared successfully!',
        backgroundColor: Colors.white24,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to share image.',
        backgroundColor: Colors.white24,
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  // .zoom_in + icon
  void zoomIn() {
    scale += 0.2;
    update();
  }

  // zoom_out - icon
  void zoomOut() {
    scale = scale > 0.2 ? scale - 0.2 : scale;
    update();
  }
}
