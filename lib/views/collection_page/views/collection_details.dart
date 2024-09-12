import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gems_convter/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class CollectionDetails extends StatelessWidget {
  static const routeName = '/CollectionDetails';

  CollectionDetails({super.key});

  final dynamic data = Get.arguments;
  final RxBool isDescription = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
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
        backgroundColor: AppTheme.appBar,
        title: Text(
          'Collection Details',
          style: AppTheme.whiteBig,
        ),
        centerTitle: true,
      ),
      body: (data == null)
          ? SizedBox(
              child: Center(
                child: Text(
                  'No Data Back To Home',
                  style: AppTheme.whiteBig,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppTheme.cont2,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        data['Name'],
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.details,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          data['asset'] == null
                              ? const SizedBox()
                              : Column(
                                  children: List.generate(
                                    data['asset'].length > 6 ? 4 : 3,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        showDialogBox(data['asset'][index]);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: AppTheme.cont1,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: data['asset'][index]
                                              ['image'],
                                          height: 65,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const CupertinoActivityIndicator(
                                            radius: 20,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          Container(
                            // height: 400,
                            width: 220,
                            decoration: BoxDecoration(
                              color: AppTheme.cont,
                              border:
                                  Border.all(color: Colors.white70, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.all(10),
                            child: Hero(
                              tag: data['image'],
                              child: CachedNetworkImage(
                                imageUrl: data['image'],
                                // height: 300,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(
                                  radius: 20,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                ),
                              ),
                            ),
                          ),
                          data['asset'] == null
                              ? const SizedBox()
                              : Column(
                                  children: List.generate(
                                    data['asset'].length - 4,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        // print(index);
                                        showDialogBox(data['asset'][index + 4]);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: AppTheme.cont1,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: data['asset'][index + 4]
                                              ['image'],
                                          height: 65,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const CupertinoActivityIndicator(
                                            radius: 20,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        height: 3,
                        width: Get.width,
                        margin: const EdgeInsets.all(10),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          (data['Type'] == null)
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Type : ',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.info,
                                    ),
                                    Text(
                                      '${data['Type']}',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.details,
                                    ),
                                  ],
                                ),
                          (data['Rarity'] == null)
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 20,
                                ),
                          (data['Rarity'] == null)
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rarity : ',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.info,
                                    ),
                                    Text(
                                      '${data['Rarity']}',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.details,
                                    ),
                                  ],
                                ),
                          (data['Rarity'] == null)
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 30,
                                ),
                          (data['Price'] == null)
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price : ',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.info,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.2,
                                      child: Text(
                                        '${data['Price']}',
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTheme.details,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                      data['Details'] == null
                          ? const SizedBox()
                          : const SizedBox(
                              height: 20,
                            ),
                      data['Details'] == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Details : ',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTheme.info,
                                  ),
                                  SizedBox(
                                    width: 278,
                                    child: Text(
                                      '${data['Details']}',
                                      style: AppTheme.details,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                      data['Description'] == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description : ',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppTheme.info,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => SizedBox(
                                          width: 232,
                                          child: Text(
                                            (isDescription.value ||
                                                    data['Description']
                                                            .length <=
                                                        82)
                                                ? data['Description']
                                                : '${data['Description'].substring(0, 82)}...',
                                            style: AppTheme.details,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      (data['Description'].length > 82)
                                          ? Obx(
                                              () => InkWell(
                                                onTap: () {
                                                  isDescription.value =
                                                      !isDescription.value;
                                                },
                                                child: Text(
                                                  isDescription.value
                                                      ? 'See Less'
                                                      : 'See More',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void showDialogBox(
    Map data,
  ) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(5),
          height: Get.height * 0.44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppTheme.cont1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(
                imageUrl: data['image'],
                height: 160,
                // fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                data['Name'],
                style: AppTheme.info,
                textAlign: TextAlign.center,
              ),
              Text(
                'No : ${data['number']}',
                style: AppTheme.info,
                textAlign: TextAlign.center,
              ),
              Text(
                data['Type'],
                style: AppTheme.info,
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.06,
                  width: Get.width * 0.24,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.cont,
                  ),
                  child: Text(
                    'Ok',
                    style: AppTheme.info1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
