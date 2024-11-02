import 'package:ecommerce_delivery/data/remote/archive_data.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/constant/app_string.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/model/home_model.dart';
import '../data/remote/accepted_data.dart';

class ArchivedOrderController extends GetxController{
  ArchiveData archiveData=ArchiveData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  List <HomeModel>archiveModel=[];
  getDeliveredData()async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await archiveData.getData(myServices.sharedPreferences.getString(userId)!);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success'){
        List homeData=response['data'];
        archiveModel=homeData.map((data)=>HomeModel.fromJson(data)).toList();
        print('sucess');

      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getDeliveredData();
  }
}