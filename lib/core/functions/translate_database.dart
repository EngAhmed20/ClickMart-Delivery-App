 import 'package:ecommerce_delivery/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(ar,en){
  MyServices myServices=Get.find();
  if(myServices.sharedPreferences.getString('lang')=='en'){
    return en;
  }
  else{
    return ar;
  }

}