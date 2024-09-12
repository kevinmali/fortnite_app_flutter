import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class CrewData extends StatelessWidget {
  static const routeName = '/CrewData';
  CrewData({super.key});
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cont,
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          data['item']['name'],
          style: AppTheme.name1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: data['item']['images']['icon'],
              fit: BoxFit.cover,
              height: 120,
              width: 120,
              placeholder: (context, url) => const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 5,
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
            ),
            Text(
              data['item']['description'],
              overflow: TextOverflow.ellipsis,
              style: AppTheme.whiteText,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['item']['introduction']['chapter'],
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.info1,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  data['item']['introduction']['season'],
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.info1,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  border: Border.all(width: 2, color: Colors.white)),
              child: Column(
                children: [
                  Text(
                    'gameplayTags',
                    style: AppTheme.whiteBig,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: data['item']['gameplayTags'].length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // var data = data['rewards'][0]['item']['gameplayTags'];
                      // print(crewData);
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        color: Colors.white24,
                        child: Text(
                          '${data['item']['gameplayTags'][index]}',
                          style: AppTheme.whiteText,
                        ),
                      );
                    },
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
