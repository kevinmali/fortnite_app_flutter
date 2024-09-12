import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class LandDetails extends StatelessWidget {
  static const routeName = '/LandDetails';

  LandDetails({super.key});

  final landData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, dynamic>> matchmakingEntries =
        landData['matchmaking'].entries.toList();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: landData['image'],
                fit: BoxFit.fill,
                height: 200,
                width: 400,
                placeholder: (context, url) => const CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Code : ',
                  style: AppTheme.info1,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${landData['code']}',
                      style: AppTheme.info,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Version : ',
                  style: AppTheme.info1,
                  children: [
                    TextSpan(
                      text: '${landData['latestVersion']}',
                      style: AppTheme.info,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Date : ',
                  style: AppTheme.info1,
                  children: [
                    TextSpan(
                      text: '${landData['publishedDate']}',
                      style: AppTheme.info,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'creator : ',
                  style: AppTheme.info1,
                  children: [
                    TextSpan(
                      text: '${landData['creator']}',
                      style: AppTheme.info,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      landData['title'],
                      style: AppTheme.details,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.white,
                      endIndent: 50,
                      indent: 50,
                    ),
                    Text(
                      landData['description'],
                      style: AppTheme.seeMore,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 50,
                    mainAxisSpacing: 5,
                  ),
                  // scrollDirection: Axis.horizontal,
                  itemCount: landData['tags'].length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 40,
                      width: 94,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                      child: Text(
                        landData['tags'][i],
                        style: AppTheme.name1,
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white24,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      padding: const EdgeInsets.all(2),
                      width: Get.width * 0.53,
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
                        border: Border.all(
                          width: 4,
                          color: const Color(0xffFFECB2),
                        ),
                      ),
                      child: Text(
                        'matchmaking ',
                        style: AppTheme.whiteBig,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.86,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: matchmakingEntries.length,
                        itemBuilder: (ctx, i) {
                          final entry = matchmakingEntries[i];
                          return Column(
                            children: [
                              const Divider(
                                color: Colors.white,
                                thickness: 3,
                              ),
                              Text(
                                '${entry.key}:',
                                style: AppTheme.details,
                              ),
                              Text(
                                '${entry.value}',
                                style: AppTheme.name1,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
