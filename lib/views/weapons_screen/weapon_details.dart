import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class WeaponDetails extends StatelessWidget {
  static const routeName = '/WeaponDetails';
  WeaponDetails({super.key});

  final weaponData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, dynamic>> statsList =
        weaponData['mainStats'].entries.toList();
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
          'Weapon Detail',
          style: AppTheme.info1,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weaponData['name'],
                overflow: TextOverflow.ellipsis,
                style: AppTheme.whiteBig,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: Get.width * 0.95,
                child: Column(
                  children: [
                    Text(
                      weaponData['description'],
                      // overflow: TextOverflow.ellipsis,
                      style: AppTheme.details,
                    ),
                    // Text(
                    //   'ID : ${weaponData['id']}',
                    //   // overflow: TextOverflow.ellipsis,
                    //   style: AppTheme.details,
                    // ),
                    // Text(
                    //   weaponData['searchTags'],
                    //   // overflow: TextOverflow.ellipsis,
                    //   style: AppTheme.details,
                    // ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                // alignment: Alignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10, top: 10),
                      padding: const EdgeInsets.all(2),
                      // width: Get.width * 0.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffFFECB2).withOpacity(0.2),
                            offset: const Offset(2, 3),
                          ),
                          BoxShadow(
                            color: const Color(0xffFFECB2).withOpacity(0.2),
                            offset: const Offset(1, 3),
                          ),
                        ],
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffFFECB2),
                        ),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rarity ',
                            style: AppTheme.whiteBig,
                          ),
                          Text(
                            weaponData['rarity'],
                            style: AppTheme.info1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'asset/images/weapons_images/Rectangle 42060.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: weaponData['images']['icon'],
                        // fit: BoxFit.cover,
                        height: 180,
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error_outline);
                        },
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(
                          radius: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: statsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 116,
                        ),
                        itemBuilder: (ctx, i) {
                          var stat = statsList[i];
                          return Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.1),
                              border: Border.all(
                                width: 2,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  stat.key,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.name1,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${stat.value}',
                                  style: AppTheme.info1,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //         margin: const EdgeInsets.all(5),
                    //         padding: const EdgeInsets.all(10),
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //             width: 2,
                    //             color: Colors.black54,
                    //           ),
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: [
                    //             Image.asset(
                    //               'asset/images/weapons_images/speed.PNG',
                    //               height: Get.height * 0.04,
                    //             ),
                    //             Column(
                    //               children: [
                    //                 Text(
                    //                   'BulletsPer',
                    //                   style: AppTheme.name1,
                    //                 ),
                    //                 Text(
                    //                   '${weaponData['mainStats']['BulletsPerCartridge']}',
                    //                   style: AppTheme.info1,
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         )),
                    //     Container(
                    //         margin: const EdgeInsets.all(5),
                    //         padding: const EdgeInsets.all(10),
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //             width: 2,
                    //             color: Colors.black54,
                    //           ),
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: [
                    //             Image.asset(
                    //               'asset/images/weapons_images/hell.PNG',
                    //               height: Get.height * 0.04,
                    //             ),
                    //             Column(
                    //               children: [
                    //                 Text(
                    //                   'DamageZon',
                    //                   style: AppTheme.name1,
                    //                 ),
                    //                 Text(
                    //                   '${weaponData['mainStats']['DamageZone_Critical']}',
                    //                   style: AppTheme.info1,
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         )),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       margin: const EdgeInsets.all(5),
                    //       padding: const EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           width: 2,
                    //           color: Colors.black54,
                    //         ),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Image.asset(
                    //             'asset/images/weapons_images/fire.PNG',
                    //             height: Get.height * 0.04,
                    //           ),
                    //           Column(
                    //             children: [
                    //               Text(
                    //                 'FiringRate',
                    //                 style: AppTheme.name1,
                    //               ),
                    //               Text(
                    //                 '${weaponData['mainStats']['FiringRate']}',
                    //                 style: AppTheme.info1,
                    //               ),
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //         margin: const EdgeInsets.all(5),
                    //         padding: const EdgeInsets.all(10),
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //             width: 2,
                    //             color: Colors.black54,
                    //           ),
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: [
                    //             Image.asset(
                    //               'asset/images/weapons_images/bullet.PNG',
                    //               height: Get.height * 0.04,
                    //             ),
                    //             Column(
                    //               children: [
                    //                 Text(
                    //                   'ReloadTime',
                    //                   style: AppTheme.name1,
                    //                 ),
                    //                 Text(
                    //                   '${weaponData['mainStats']['ReloadTime']}',
                    //                   style: AppTheme.info1,
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         )),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffFFECB2),
                  ),
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
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffFFECB2).withOpacity(0.2),
                            offset: const Offset(2, 3),
                          ),
                          BoxShadow(
                            color: const Color(0xffFFECB2).withOpacity(0.2),
                            offset: const Offset(1, 3),
                          ),
                        ],
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffFFECB2),
                        ),
                      ),
                      child: Text(
                        'gameplayTags ',
                        style: AppTheme.whiteBig,
                      ),
                    ),
                    SizedBox(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: weaponData['gameplayTags'].length,
                          itemBuilder: (ctx, i) {
                            return Column(
                              children: [
                                i < weaponData['gameplayTags'].length
                                    ? const Divider(
                                        thickness: 3,
                                        color: Colors.white,
                                      )
                                    : const SizedBox(),
                                Text(
                                  weaponData['gameplayTags'][i],
                                  textAlign: TextAlign.center,
                                  style: AppTheme.name1,
                                ),
                              ],
                            );
                          }),
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
