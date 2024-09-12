import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/controller/map_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class GameDetails extends StatelessWidget {
  static const routeName = '/GameDetails';
  GameDetails({super.key});

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MapController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppTheme.cont,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppTheme.cont2,
              ),
            ),
            title: Text(
              'Game Details',
              style: AppTheme.info1,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: '${data['image']}',
                        fit: BoxFit.cover,
                        height: Get.height * 0.3,
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(
                          radius: 5,
                          color: Colors.white,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppTheme.cont1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Text('${controller.likes}',
                            style: AppTheme.details),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.remove_red_eye_sharp,
                        color: AppTheme.cont1,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Text('${controller.views}',
                            style: AppTheme.details),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppTheme.cont2,
                  ),
                  Divider(
                    color: AppTheme.cont2,
                    endIndent: Get.width * 0.2,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Name : ',
                      style: AppTheme.whiteText,
                      children: [
                        TextSpan(
                          text: '${data['name']}',
                          style: AppTheme.details,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Description : ',
                      style: AppTheme.whiteText,
                      children: [
                        TextSpan(
                          text: '${data['description']}',
                          style: AppTheme.details,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Divider(
                    color: AppTheme.cont2,
                    endIndent: Get.width * 0.2,
                  ),
                  Divider(
                    color: AppTheme.cont2,
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          String skins = data['image'];
                          controller.saveNetworkImage(skins);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.04,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            image: const DecorationImage(
                              image: AssetImage(
                                  'asset/images/game_images/Fortnite Festival Background.PNG'),
                              fit: BoxFit.fill,
                            ),
                            // color: const Color(0xff9DDE8B),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       spreadRadius: 3,
                            //       blurRadius: 5,
                            //       color: Colors.white),
                            // ],
                            border: Border.all(width: 2, color: Colors.black87),
                          ),
                          child: Text(
                            'Download',
                            style: AppTheme.info,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          String skins = data['image'];
                          controller.shareImage(skins);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.04,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            image: const DecorationImage(
                              image: AssetImage(
                                  'asset/images/game_images/Fortnite Festival Background.PNG'),
                              fit: BoxFit.fill,
                            ),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     offset: Offset(0.1, 0.2),
                            //     spreadRadius: 3,
                            //     blurRadius: 5,
                            //   )
                            // ],
                            border: Border.all(width: 2, color: Colors.black87),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Share',
                                style: AppTheme.name1,
                              ),
                              const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
