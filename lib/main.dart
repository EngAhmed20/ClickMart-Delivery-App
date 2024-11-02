import 'package:ecommerce_delivery/binding.dart';
import 'package:ecommerce_delivery/core/constant/page_route.dart';
import 'package:ecommerce_delivery/core/localization/translation.dart';
import 'package:ecommerce_delivery/core/services/services.dart';
import 'package:ecommerce_delivery/view/lang/lang_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/change_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CallServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   LocalController localController= Get.put(LocalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,


      ),
      getPages:pageRoutes,
      translations: MyTranslation(),
      locale: localController.initial,
      debugShowCheckedModeBanner: false,
      initialBinding:MyBinding() ,
    );
  }
}

