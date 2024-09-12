import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/weapons_screen/weapon_details.dart';
import 'package:get/get.dart';

import '../../controller/api_controller.dart';

class WeaponPage extends StatelessWidget {
  static const routeName = '/WeaponPage';

  const WeaponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ApiController(),
      builder: (controller) {
        // print(controller.apiWeapon);
        return Scaffold(
          backgroundColor: const Color(0xff443500),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              'WeaponPage',
              style: AppTheme.info1,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            itemCount: controller.apiWeapon.length,
            // itemExtent: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (ctx, i) {
              // print(controller.apiWeapon[i]['images']['icon']);
              return controller.apiWeapon[i]['images']['icon'] == null
                  ? SizedBox(
                      child: Text(
                        "no data$i",
                        style: AppTheme.info1,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          WeaponDetails.routeName,
                          arguments: controller.apiWeapon[i],
                        );
                      },
                      child: AnimationConfiguration.staggeredList(
                        position: i,
                        duration: const Duration(milliseconds: 300),
                        child: FlipAnimation(
                          curve: Curves.easeIn,
                          child: FadeInAnimation(
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'asset/images/weapons_images/Rectangle 42060.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xffFF8A00),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: controller.apiWeapon[i]['images']
                                        ['icon'],
                                    // fit: BoxFit.cover,
                                    height: 140,
                                    errorWidget: (context, url, error) {
                                      return const Icon(Icons.error_outline);
                                    },
                                    placeholder: (context, url) =>
                                        const CupertinoActivityIndicator(
                                      radius: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    controller.apiWeapon[i]['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.name1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
