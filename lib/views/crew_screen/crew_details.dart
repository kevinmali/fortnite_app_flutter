import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:fortnite_app/views/crew_screen/crew_charcater_data.dart';
import 'package:get/get.dart';

class CrewDetails extends StatelessWidget {
  static const routeName = '/CrewDetails';
  final dynamic crewData;
  const CrewDetails({super.key, required this.crewData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cont,
      // appBar: AppBar(
      //   title: Text(
      //     'Crew Detail',
      //     style: AppTheme.info1,
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(-1, 1),
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: crewData['images']['itemShopTile'],
                    fit: BoxFit.fill,
                    height: Get.height * 0.42,
                    width: Get.width,
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(
                      radius: 5,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error_outline),
                  ),
                ),
                const BackButton(
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.78,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: crewData['rewards'].length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.white24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${crewData['rewards'][i]['quantity']}',
                          style: AppTheme.whiteText,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: crewData['rewards'][i]['item']['images']
                                ['icon'],
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(
                              color: Colors.white,
                              radius: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: Get.width * 0.6,
                              child: Text(
                                '${crewData['rewards'][i]['item']['id']}',
                                style: AppTheme.whiteText,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '${crewData['rewards'][i]['item']['name']}',
                              style: AppTheme.whiteText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(CrewData.routeName,
                                    arguments: crewData['rewards'][i]);
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
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
