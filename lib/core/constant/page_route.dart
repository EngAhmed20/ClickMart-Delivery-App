import 'package:ecommerce_delivery/core/services/services.dart';
import 'package:ecommerce_delivery/view/auth/widget/forget_pass.dart';
import 'package:ecommerce_delivery/view/lang/lang_view.dart';
import 'package:ecommerce_delivery/view/orders/accepted_orders.dart';
import 'package:ecommerce_delivery/view/orders/archived_orders.dart';
import 'package:ecommerce_delivery/view/orders/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../view/auth/login_scr.dart';
import '../../view/auth/widget/reset_pass.dart';
import '../../view/auth/widget/success_reset.dart';
import '../../view/auth/widget/verify_code.dart';
import '../../view/root_home/root_home.dart';
import 'app_string.dart';
List<GetPage<dynamic>>? pageRoutes=[
  GetPage(name: '/', page:()=>LangView(),middlewares: [AppMiddleWare()]),
  GetPage(name: '/login', page:()=>LoginScr()),
  GetPage(name: '/forgetPass', page: ()=>ForgetPassScr()),
GetPage(name: '/resetPass', page:()=>ResetPassScr()) ,
GetPage(name: '/verifyPass', page:()=>VerifyCodeScr()) ,
  GetPage(name: '/sucessResetPass', page:()=>SuccessResetPass()) ,
  GetPage(name: '/root_home', page:()=>RootHome()) ,
  GetPage(name: '/accepted', page: ()=>AcceptedOrders()),
  GetPage(name: '/archive', page: ()=>ArchivedOrders()),
  GetPage(name: '/details', page: ()=>OrderDetailsScr()) ,


];
class AppMiddleWare extends GetMiddleware{
  MyServices myServices=Get.find();
  @override
  RouteSettings?redirect(String?route)
  {
    if (myServices.sharedPreferences.getBool('root_home')==true){
      return const  RouteSettings(name: '/root_home');
    }
    if(myServices.sharedPreferences.getString(boardingShow) != null)
    {
      return const  RouteSettings(name: '/login');
    }
  }
}