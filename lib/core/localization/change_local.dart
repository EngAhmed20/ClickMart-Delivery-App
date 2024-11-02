import 'package:ecommerce_delivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_string.dart';
class LocalController extends GetxController{
  MyServices myServices=Get.find();
  Locale?initial;
  changeLocal(String lang){
    Locale locale=Locale(lang);
    myServices.sharedPreferences.setString('lang',lang);
    Get.updateLocale(locale);
    goToLoginPage();}
    List<String>language=<String>[];
    goToLoginPage(){
    myServices.sharedPreferences.setString(boardingShow, 'skip');
    Get.offNamed('/login');
  }
  changeLangInsideApp(String appLang){
   if(appLang=='en'.tr){
     Locale locale=Locale('en');
     language=<String>['ar'];
     myServices.sharedPreferences.setString('lang','en');
     Get.updateLocale(locale);
   }else{
     Locale locale=Locale('ar');
     language=<String>['en'];
     myServices.sharedPreferences.setString('lang','ar');

     Get.updateLocale(locale);
   }
    update();

    }
  @override
  void onInit() {
     if (myServices.sharedPreferences.getString('lang') == 'ar') {
       initial = Locale('ar');
    } else if (myServices.sharedPreferences.getString('lang') == 'en') {
       initial = Locale('en');
    } else {
       initial = Get.deviceLocale;
    }
     if(initial== Locale('ar')){
       language=<String>['en'];

     }else{
       language=<String>['ar'];


     }
  }
}

