import 'package:ecommerce_delivery/core/constant/app_string.dart';
import 'package:ecommerce_delivery/core/shared/app_style.dart';
import 'package:flutter/material.dart';

class SettingScr extends StatelessWidget {
  const SettingScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Setting 1',style: textStyle.semiBold18),
            Text('Setting 2',style: textStyle.semiBold18),
            Text('Setting 3',style: textStyle.semiBold18),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
