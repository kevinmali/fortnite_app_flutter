import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class SkinDetails extends StatelessWidget {
  static const routeName = '/SkinDetails';
  SkinDetails({super.key});

  final skinData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cont,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: AppTheme.cont2,
      //     ),
      //   ),
      //   title: Text(
      //     'hello',
      //     style: AppTheme.info1,
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
            ),
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(170),
                  bottomRight: Radius.circular(170),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.cont2,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CachedNetworkImage(
                    imageUrl: skinData['images']['icon'],
                    height: 300,
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(
                      radius: 10,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      // gradient: LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment(0.8, 1),
                      //   colors: <Color>[
                      //     Colors.orangeAccent.withOpacity(0.7),
                      //     Colors.white24,
                      //     Colors.orangeAccent.withOpacity(0.4),
                      //   ],
                      //   tileMode: TileMode.mirror,
                      // ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('asset/images/weapons_images/Union.png'),
                        Text(
                          skinData['rarity']['name'],
                          style: AppTheme.whiteText,
                        ),
                        Image.asset(
                            'asset/images/weapons_images/Union (1).png'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    color: Colors.white24,
                    child: RichText(
                      text: TextSpan(
                        text: 'Name : ',
                        style: AppTheme.whiteText,
                        children: [
                          TextSpan(
                            text: '${skinData['name']}',
                            style: AppTheme.details,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    color: Colors.white24,
                    child: RichText(
                      text: TextSpan(
                        text: 'Description : ',
                        style: AppTheme.whiteText,
                        children: [
                          TextSpan(
                            text: '${skinData['description']}',
                            style: AppTheme.details,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              border: Border.all(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: skinData['juno']['icon'],
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(
                                  radius: 5,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          Text(
                            'Juno',
                            style: AppTheme.details,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                border: Border.all(color: Colors.white),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: skinData['beans']['icon'],
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(
                                  radius: 5,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          Text(
                            'Beans',
                            style: AppTheme.details,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white24,
                          offset: Offset(2, 3),
                        ),
                        BoxShadow(
                          color: Colors.white24,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          padding: const EdgeInsets.all(2),
                          width: Get.width * 0.52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white24,
                                offset: Offset(2, 3),
                              ),
                              BoxShadow(
                                color: Colors.white24,
                                offset: Offset(1, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            'gameplayTags ',
                            style: AppTheme.whiteBig,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: skinData['gameplayTags'].length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Text(
                                  skinData['gameplayTags'][index],
                                  style: AppTheme.name1,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
