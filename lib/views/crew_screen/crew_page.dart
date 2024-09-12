import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortnite_app/controller/api_controller.dart';
import 'package:fortnite_app/views/crew_screen/crew_details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';
import '../../model/utils/text_style/style_them.dart';

class CrewScreen extends StatefulWidget {
  static const String routeName = "/CrewScreen";
  const CrewScreen({super.key});

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
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
                'Crew',
                style: AppTheme.info1,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: ListView.builder(
                itemCount: controller.crew.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: isIpad ? 170 : 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        color: Colors.white24,
                        // color: Color(
                        //     controller.nameList[index]['color']),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: CachedNetworkImage(
                              imageUrl: controller.crew[i]['images']
                                  ['itemShopTile'],
                              fit: BoxFit.fill,
                              width: 420,
                              placeholder: (context, url) =>
                                  const CupertinoActivityIndicator(
                                radius: 10,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error_outline),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.crew[i]['descriptions']['title'],
                                  style: AppTheme.whiteText,
                                ),
                                Text(
                                  controller.crew[i]['type'],
                                  style: AppTheme.whiteText,
                                ),
                                Text(controller.crew[i]['date'],
                                    style: AppTheme.whiteText),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      CrewDetails.routeName,
                                      arguments: controller.crew[i],
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(2),
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white24,
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            color: Colors.white12,
                                          ),
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            color: Colors.white10,
                                          ),
                                        ]),
                                    child: Text(
                                      'See',
                                      style: AppTheme.whiteText,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
