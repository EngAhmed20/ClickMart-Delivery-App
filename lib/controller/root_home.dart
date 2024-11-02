import 'package:ecommerce_delivery/data/model/user_model.dart';
import 'package:ecommerce_delivery/view/home/home_scr.dart';
import 'package:ecommerce_delivery/view/setting/setting_scr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';

class RootHomeController extends GetxController {
  int currentPage = 0;
  changePage(int index) {
    currentPage = index;
    update();
  }

  List<Widget> currentBody = [
    HomeScr(),
    SettingScr(),
  ];
  List titleBottomAPPBar = [
    'root_home'.tr,
    'settings'.tr,
  ];
  List BottomAppBarImg = [
    Assets.imagesDeliveryHome,
    Assets.imagesBottomSettingImg,
  ];
  @override
  void onInit() async{
    super.onInit();
  }
}
