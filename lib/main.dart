import 'package:first_provider_hero/controller/mockcontroller/delete_controller.dart';
import 'package:first_provider_hero/controller/mockcontroller/get.dart';
import 'package:first_provider_hero/controller/mockcontroller/post.dart';
import 'package:first_provider_hero/controller/mockcontroller/put.dart';
import 'package:first_provider_hero/controller/mycontroller/conter_controller.dart';
import 'package:first_provider_hero/controller/mycontroller/example3_controller.dart';
import 'package:first_provider_hero/controller/mycontroller/slider_controller.dart';
import 'package:first_provider_hero/screen/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ConterController()),
      ChangeNotifierProvider(create: (context)=>SliderProvider()),
      ChangeNotifierProvider(create: (context)=>Example3Provider()),
      ChangeNotifierProvider(create: (context)=>getApi()),
      ChangeNotifierProvider(create: (context)=>postApi()),
      ChangeNotifierProvider(create: (context)=>deleteController()),
      ChangeNotifierProvider(create: (context)=>putApi())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: DisplayScreen(),
    ),
    );
    
    
  }
}