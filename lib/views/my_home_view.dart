import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:silver_oak_test/constants/text_style.dart';

import '../controllers/my_home_controller.dart';
import '../models/my_grid_model.dart';

class MyGridView extends GetView {
  var controller = Get.put<MyHomeController>(MyHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items',style: MyTextStyle.heading,),
      ),
      body: Obx(() => Column(
        children: [ 
          Expanded(
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.gridData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final MyGridModel item = controller.gridData[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            item.urls?.small ?? "",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
            
          ),
          Visibility(visible: controller.isPageUpdating.value,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CircularProgressIndicator(), // Your circular indicator
            ),
          ),
        ],
      ),)
    );
  }
}
