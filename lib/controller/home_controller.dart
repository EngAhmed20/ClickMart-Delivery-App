import 'dart:ffi';

import 'package:ecommerce_delivery/core/class/status_request.dart';
import 'package:ecommerce_delivery/core/constant/app_string.dart';
import 'package:ecommerce_delivery/core/functions/handling_data.dart';
import 'package:ecommerce_delivery/core/services/services.dart';
import 'package:ecommerce_delivery/data/model/home_model.dart';
import 'package:ecommerce_delivery/data/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/add_remove_snack.dart';

class HomeController extends GetxController{
HomeData homeData=HomeData(Get.find());
StatusRequest statusRequest=StatusRequest.none;
MyServices myServices=Get.find();
List <HomeModel>homeModel=[];
getOrderStatus(int val) {
   if (val == 2) {
    return 'deliver order'.tr;
  } else if (val == 3) {
    return 'on the way'.tr;
  }
  else {
    return 'order delivered'.tr;
  }
}
getHomeData()async{
  statusRequest=StatusRequest.loading;
  update();
  var response=await homeData.getData();
  statusRequest=handlingData(response);
  if(statusRequest==StatusRequest.success){
    if(response['status']=='success'){
      List homeData=response['data'];
      homeModel=homeData.map((data)=>HomeModel.fromJson(data)).toList();
      print(myServices.sharedPreferences.getString(userId));

    }else{
      statusRequest=StatusRequest.failure;
    }

  }else{
    statusRequest=StatusRequest.failure;
  }
  update();
}
acceptDeliveryOrder(String userid,String orderId)async{
  statusRequest=StatusRequest.loading;
  update();
  var response=await homeData.acceptDeliveryOrderData(orderId,userid,myServices.sharedPreferences.getString(userId)!);
  statusRequest=handlingData(response);
  if(statusRequest==StatusRequest.success){
    if(response['status']=='success'){
      add_removeSnack('added order msg',);

      await getHomeData();
      print('sucess');

    }else{
      statusRequest=StatusRequest.failure;
    }

  }else{
    statusRequest=StatusRequest.failure;
  }

}
@override
  void onInit() {
    getHomeData();
    super.onInit();
  }
  goToDetails(int index){
  Get.toNamed('/details',arguments:{
    'orderModel':homeModel[index]
  });
  }
}