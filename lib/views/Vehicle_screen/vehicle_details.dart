import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fortnite_app/model/utils/text_style/style_them.dart';
import 'package:get/get.dart';

class VehicleDetails extends StatelessWidget {
  static const routeName = '/VehicleDetails';
  VehicleDetails({super.key});
  final vehicleData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, dynamic>> statsList =
        vehicleData['stats'].entries.toList();
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
          'Vehicle Details',
          style: AppTheme.info1,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: vehicleData['icon'],
                height: 200,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'asset/images/vehicle_images/shadow.png',
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Text(
                vehicleData['id'],
                style: AppTheme.name1,
              ),
              Text(
                vehicleData['name'],
                style: AppTheme.info1,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: statsList.length,
                  physics: const NeverScrollableScrollPhysics(),
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
                  })
            ],
          ),
        ),
      ),
    );
  }
}
