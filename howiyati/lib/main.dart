import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobiurbain/Oran/BottomBarPresenter.dart';
import 'package:mobiurbain/Oran/FirestScreen.dart';
import 'package:mobiurbain/Oran/HomeApp.dart';
import 'package:mobiurbain/Oran/RdvPresenter.dart';
import 'package:mobiurbain/Oran/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      
         ChangeNotifierProvider(
          create: (_) => BottomBarPresenter(),
        ),
         ChangeNotifierProvider(
          create: (_) => RdvPresenter(),
        ),
      ],
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
