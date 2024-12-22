import 'package:flutter/material.dart';
import 'package:app_launcher/app_launcher.dart';
import 'package:mobiurbain/Oran/FirestScreen.dart';
import 'package:mobiurbain/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/oran/logo.png"),
            //Expanded(child: Container()),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                    Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FirstScreen()));
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 64,vertical: 16),
                  decoration: BoxDecoration(
                    color: selectIcon,
                    borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 0.1, color: Colors.grey)),
                  child: Text("زائر",
                      style: TextStyle(fontSize: 18, color:Colors.white,fontWeight: FontWeight.w700)),
                ),
              ),
            ),
SizedBox(height: 48,),

               Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  _openExternalApp();
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 64,vertical: 16),
                  decoration: BoxDecoration(
                    color: selectIcon,
                    borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 0.1, color: Colors.grey)),
                  child: Text("تسجيل الدخول",
                      style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  
  Future<void> _openExternalApp() async {
    const String packageName = 
        'dz.mobilis.dzid'; 

    try {
      bool isAppAvailable =
          await AppLauncher.hasApp(androidApplicationId: packageName);
      if (isAppAvailable) {
        await AppLauncher.openApp(androidApplicationId: packageName);
      } else {
        final Uri playStoreUri = Uri.parse(
            'https://play.google.com/store/apps/details?id=$packageName');
        if (await canLaunch(playStoreUri.toString())) {
          await launch(playStoreUri.toString());
        } else {
          print('Could not open Play Store.');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

