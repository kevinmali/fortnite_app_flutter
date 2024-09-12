import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/skin_screen/skin_details.dart';
import 'package:get/get.dart';

class SkinsPage extends StatelessWidget {
  static const routeName = '/SkinsPage';

  const SkinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ApiController(),
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
                'Skins',
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: AnimationLimiter(
              child: ListView.builder(
                itemCount: controller.skin.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(controller.skin[index]['images']['icon']);
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BlurryContainer(
                            blur: 8,
                            height: 240,
                            elevation: 8,
                            shadowColor: Colors.white.withOpacity(0.7),
                            padding: const EdgeInsets.all(32),
                            color: Colors.white.withOpacity(0.15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        controller.skin[index]['images']
                                            ['icon'],
                                      ),
                                    ),
                                    const Spacer(),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.toNamed(SkinDetails.routeName,
                                              arguments:
                                                  controller.skin[index]);
                                        },
                                        icon: const Icon(
                                          Icons.play_arrow,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "${controller.skin[index]['id']}",
                                  style: AppTheme.info,
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  children: [
                                    Text(
                                      "${controller.skin[index]['name']}"
                                          .toUpperCase(),
                                      style: AppTheme.details,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "price",
                                      style: AppTheme.details,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${controller.skin[index]['price']}",
                                      style: AppTheme.seeMore,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
