import 'package:ecommerce_delivery/controller/tracking_controller.dart';
import 'package:ecommerce_delivery/core/class/status_request.dart';
import 'package:ecommerce_delivery/core/services/services.dart';
import 'package:ecommerce_delivery/data/remote/accepted_data.dart';
import 'package:ecommerce_delivery/data/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/constant/app_string.dart';
import '../core/functions/add_remove_snack.dart';
import '../core/functions/handling_data.dart';
import '../data/model/home_model.dart';

class AcceptedOrdersController extends GetxController{
  AcceptedData acceptedData=AcceptedData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  List <HomeModel>accModel=[];
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
  getAcceptedData()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await acceptedData.getData(myServices.sharedPreferences.getString(userId)!);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        List homeData=response['data'];
        accModel=homeData.map((data)=>HomeModel.fromJson(data)).toList();
        print('sucess');

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  orderDelivered(String userid,String orderId)async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await acceptedData.completeDelivered(orderId,userid,myServices.sharedPreferences.getString(userId).toString());
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        add_removeSnack('order complete msg',);

        await getAcceptedData();
        TrackingController controller=Get.put(TrackingController());
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
    getAcceptedData();
    super.onInit();
  }
  goToDetails(int index){
    Get.toNamed('/details',arguments:{
      'orderModel':accModel[index]
    });
  }


}