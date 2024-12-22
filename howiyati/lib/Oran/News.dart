import 'package:flutter/material.dart';
import 'package:mobiurbain/Oran/NewsDetail.dart';

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _News();
  }
}

class _News extends State<News> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("الاخبار البارزة"),
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
          width: width,
          child: SingleChildScrollView(
            child:
                Column(children: [for (int i = 0; i < 10; i++) _newsWidget()]),
          ),
        ),
      ),
    );
  }

  Widget _newsWidget() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewsDetail()));
        },
        child: Ink(
          child: Container(
            width: width,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "32.7k",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "الحكومة تطلق المنصة الوطنية للحج",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 14),
                            ),
                            Container(
                              width: width * 0.5,
                              child: Text(
                                "البطاقات الجديدة تتضمن ميزات أمان متقدمة وإمكانية الربط مع الخدمات الإلكترونية.",
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w200, fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),
                )),
                SizedBox(
                  width: 5,
                ),
                Image.asset("assets/oran/idcard.png", width: 50, height: 50),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.withOpacity(0.3))),
          ),
        ),
      ),
    );
  }
}
