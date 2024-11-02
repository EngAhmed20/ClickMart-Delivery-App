import 'package:ecommerce_delivery/controller/root_home.dart';
import 'package:ecommerce_delivery/view/auth/widget/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class RootHome extends StatelessWidget {
  const RootHome({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(RootHomeController());
    return GetBuilder<RootHomeController>(builder:(controller)=>Scaffold(
      body: controller.currentBody[controller.currentPage],
        bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(controller.BottomAppBarImg.length,(index)=>CustomBottomAppBar(onPressed: (){
              controller.changePage(index);
            },text: controller.titleBottomAPPBar[index], active:controller.currentPage==index?true:false, bottmImg: controller.BottomAppBarImg[index]))
            //CustomBottomAppBar(onPressed: (){}, icon:Icons.settings, text: 'home', active: true,)


          ],
        ),
      ),
    ) );
  }
}
