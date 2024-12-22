import 'package:flutter/material.dart';

class Edocument extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Edocument();
  }

}

class _Edocument extends State<Edocument>{
  late double height,width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
   return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text("الوثائق",style: TextStyle(color: Colors.black),),
      actions: [InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.arrow_back_ios_new_sharp)),
        ),
      )],
    ),
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Container(
        height: height,
        width: width,

            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 50,),
                     Image.asset("assets/oran/document.png")
              ]),
            ),
      ),
    ),
   );
  }

}