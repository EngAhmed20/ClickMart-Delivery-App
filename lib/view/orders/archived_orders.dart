import 'package:ecommerce_delivery/controller/archived_order_controller.dart';
import 'package:ecommerce_delivery/core/constant/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handling_data_view.dart';
import '../../core/shared/app_style.dart';
import '../home/widget/home_order.dart';

class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchivedOrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text('arch order'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        centerTitle: true,
        leading:IconButton(onPressed:(){
          Get.back();
        },icon: Icon(Icons.arrow_back_ios,color: AppColors.primaryColor,size: 30),) ,


      ),
      body: GetBuilder<ArchivedOrderController>(
        builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:(context,index)=> HomeOrderCard(orderNumber: '${controller.archiveModel[index].ordersId}',
              deliveryMethod: '${controller.archiveModel[index]}',
              paymentMethod: '${controller.archiveModel[index].ordersPaymentmethod}',
              orderPrice: '${controller.archiveModel[index].ordersPrice}',
              deliveryPrice: '${controller.archiveModel[index].ordersId}',
              totalPrice: '${controller.archiveModel[index].ordersTotalprice}',
              showButton: false,
              orderStatus: '${controller.archiveModel[index].ordersId}',
              date: '${controller.archiveModel[index].ordersDatetime}',
              acceptOrder: () {   },),itemCount: controller.archiveModel.length,)

        ],),failureText: Text('empty delivery archive'.tr,style: textStyle.semiBold20,),),),

    );

  }
}
