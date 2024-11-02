import 'package:ecommerce_delivery/controller/home_controller.dart';
import 'package:ecommerce_delivery/core/class/handling_data_view.dart';
import 'package:ecommerce_delivery/core/constant/app_string.dart';
import 'package:ecommerce_delivery/core/shared/app_style.dart';
import 'package:ecommerce_delivery/view/home/widget/home_drawer.dart';
import 'package:ecommerce_delivery/view/home/widget/home_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScr extends StatelessWidget {
  const HomeScr({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController=Get.put(HomeController());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('today orders'.tr,style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          _scaffoldKey.currentState?.openEndDrawer(); // فتح القائمة الجانبية
        }, icon: const Icon(Icons.menu,size: 35,color: AppColors.primaryColor,))],
      ),
        endDrawer:homeDrawer(),
      body:GetBuilder<HomeController>(
        builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:(context,index)=> HomeOrderCard(orderNumber: '${controller.homeModel[index].ordersId}',
              deliveryMethod: '${controller.homeModel[index]}',
              viewDetails: (){controller.goToDetails(index);},
              paymentMethod: '${controller.homeModel[index].ordersPaymentmethod}',
              orderPrice: '${controller.homeModel[index].ordersPrice}',
              deliveryPrice: '${controller.homeModel[index].ordersId}',
              totalPrice: '${controller.homeModel[index].ordersTotalprice}',
              orderStatus: '${controller.homeModel[index].ordersId}',
              date: '${controller.homeModel[index].ordersDatetime}',
              acceptOrder: () {controller.acceptDeliveryOrder(controller.homeModel[index].ordersUsersId.toString(), controller.homeModel[index].ordersId.toString());  },),itemCount: controller.homeModel.length,)

        ],),failureText: Text('no orders'.tr,style: textStyle.semiBold20,),),
      )

    );
  }
}

