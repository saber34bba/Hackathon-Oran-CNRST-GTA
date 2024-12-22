import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Setting();
  }
}

class _Setting extends State<Setting> {
  late double height,width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("اعدادات"),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: RotatedBox(
                quarterTurns: 2,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.arrow_back_ios_new_rounded))),
          )
        ],
      ),
       backgroundColor: Colors.white,
       body: SafeArea(
        child: Container(
          height: height,
          width:width ,

        child: SingleChildScrollView(
          child: Column(children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal:16,vertical: 35),
              child: Image.asset("assets/oran/content.png"))

          ]),
        ),
        ),
       ),
    );
  }
}
