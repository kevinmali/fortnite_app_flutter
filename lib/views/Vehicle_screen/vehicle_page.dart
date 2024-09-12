import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/Vehicle_screen/vehicle_details.dart';
import 'package:get/get.dart';

class VehiclePage extends StatelessWidget {
  static const routeName = '/VehiclePage';

  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ApiController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppTheme.background,
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
                'Vehicle',
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 250, crossAxisCount: 2),
                itemCount: controller.vehicle.length,
                itemBuilder: (ctx, i) {
                  // print(controller.vehicle.length);
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        VehicleDetails.routeName,
                        arguments: controller.vehicle[i],
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.cont2,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppTheme.cont2.withOpacity(0.2),
                            ),
                            child: Text(
                              controller.vehicle[i]['name'],
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.name1,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'asset/images/vehicle_images/shadow.png',
                                width: Get.width * 0.95,
                                // height: Get.height * 0.04,
                                fit: BoxFit.fill,
                              ),
                              CachedNetworkImage(
                                imageUrl: controller.vehicle[i]['icon'],
                                height: 120,
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(
                                  color: Colors.white,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error_outline),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            // height: Get.height * 0.022,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppTheme.cont2.withOpacity(0.2),
                            ),
                            child: Text(
                              'Next',
                              style: AppTheme.info,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
