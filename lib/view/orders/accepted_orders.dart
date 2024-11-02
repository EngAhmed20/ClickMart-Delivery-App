import 'package:ecommerce_delivery/controller/accepted%20order_controller.dart';
import 'package:ecommerce_delivery/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_string.dart';
import '../../core/shared/app_style.dart';
import '../home/widget/home_order.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text('active order'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        centerTitle: true,
        leading:IconButton(onPressed:(){
          Get.back();
        },icon: Icon(Icons.arrow_back_ios,color: AppColors.primaryColor,size: 30),) ,


      ),
      body: GetBuilder<AcceptedOrdersController>(
        builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:(context,index)=> HomeOrderCard(orderNumber: '${controller.accModel[index].ordersId}',
              deliveryMethod: '${controller.accModel[index]}',
              viewDetails: (){controller.goToDetails(index);},
              paymentMethod: '${controller.accModel[index].ordersPaymentmethod}',
              orderPrice: '${controller.accModel[index].ordersPrice}',
              deliveryPrice: '${controller.accModel[index].ordersId}',
              totalPrice: '${controller.accModel[index].ordersTotalprice}',
              archiveText: 'delivery complete'.tr,
              orderStatus: '${controller.accModel[index].ordersId}',
              date: '${controller.accModel[index].ordersDatetime}',
              acceptOrder: () {controller.orderDelivered(controller.accModel[index].ordersUsersId.toString(), controller.accModel[index].ordersId.toString()); },),itemCount: controller.accModel.length,)

        ],),failureText: Text('empty orders delivery'.tr,style: textStyle.semiBold20,),),),
    );
  }
}
