import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

import 'land_details.dart';

class IsLand extends StatelessWidget {
  static const routeName = '/IsLand';
  const IsLand({super.key});

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
                'Island',
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: ListView.builder(
                itemCount: controller.isLand.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      Container(
                        height: Get.height * 0.3,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white, offset: Offset(5, 5)),
                            BoxShadow(
                                color: Colors.white, offset: Offset(-5, -5))
                          ],
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: controller.isLand[i]['image'],
                          fit: BoxFit.cover,
                          height: 400,
                          width: 400,
                          placeholder: (context, url) =>
                              const CupertinoActivityIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(LandDetails.routeName,
                              arguments: controller.isLand[i]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.06,
                          width: Get.width * 0.6,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.white12, offset: Offset(5, 5)),
                              BoxShadow(
                                  color: Colors.white12, offset: Offset(-5, -5))
                            ],
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            'See Detail',
                            style: AppTheme.whiteText,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          );
        });
  }
}
