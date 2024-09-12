import 'package:flutter/material.dart';
import 'package:gems_convter/model/utils/text_style/style_them.dart';
import 'package:gems_convter/views/counter/controller/gems_controller.dart';
import 'package:get/get.dart';

import '../../../model/global/varibales.dart';

class DailyConvert extends StatelessWidget {
  static const routeName = '/DailyConvert';
  const DailyConvert({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GemsController(),
        builder: (gemsController) {
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
                'Daily Counter',
                style: AppTheme.whiteBig,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/images/convertimage.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 80),
                    Obx(
                      () => Container(
                        height: Get.height * 0.16,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffE0E5B6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Builder Club',
                                  style: AppTheme.info,
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Image.asset(
                                  'asset/images/gems.png',
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${gemsController.bClub.value}',
                                  style: AppTheme.info,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Turbo BC',
                                  style: AppTheme.info,
                                ),
                                const SizedBox(
                                  width: 110,
                                ),
                                Image.asset(
                                  'asset/images/gems.png',
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${gemsController.tBc.value}',
                                  style: AppTheme.info,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Outrageous BC',
                                  style: AppTheme.info,
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                                Image.asset(
                                  'asset/images/gems.png',
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${gemsController.oBc.value}',
                                  style: AppTheme.info,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: Get.height * 0.08,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: gemsController.textEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        // onChanged: (value) {
                        //   gemsController.updateDollarDaily(value);
                        //   gemsController.updateDollarTBc(value);
                        //   gemsController.updateDollarOBc(value);
                        // },
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Global.box
                            .write('count', gemsController.counter.value + 1);
                        gemsController.counter.value = Global.box.read('count');
                        FocusManager.instance.primaryFocus?.unfocus();
                        String gemText =
                            gemsController.textEditingController.text;
                        if (gemText.isNotEmpty) {
                          gemsController.updateDollarDaily(gemText);
                          gemsController.updateDollarTBc(gemText);
                          gemsController.updateDollarOBc(gemText);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.height * 0.08,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Count',
                          style: AppTheme.info1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
