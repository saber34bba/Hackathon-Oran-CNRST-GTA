import 'package:flutter/material.dart';
import 'package:mobiurbain/Widgets/CustomTextField.dart';
import 'package:mobiurbain/Oran/CustomCalendar.dart';
import 'package:mobiurbain/Oran/Edocument.dart';
import 'package:mobiurbain/Oran/Models.dart';
import 'package:mobiurbain/Oran/News.dart';
import 'package:mobiurbain/Oran/NewsDetail.dart';
import 'package:mobiurbain/Oran/RdvView.dart';
import 'package:mobiurbain/utils/const.dart';

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeApp();
  }
}

class _HomeApp extends State<HomeApp> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 25,
              ),
              entitieWidget(),
              SizedBox(
                height: 25,
              ),
              Image.asset("assets/oran/inputwithLabel.png"),
            //  CustomTextField(context, "", TextEditingController()),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "الكل",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "أهم الاشعارات",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < 3; i++) _notificationWidget()
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              _categories(),
              SizedBox(height: 25),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                       Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => News()));
                    },
                    child: Text(
                    "الكل",
                    style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "الاخبار البارزة",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              for (int i = 0; i < 3; i++) _newsWidget(),
              SizedBox(
                height: 80,
              )
            ]),
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

  List<Categories> categoriesList = [
    Categories(text: "مواعيد", path: "assets/oran/2.png"),
    Categories(text: "ادارة الفواتير", path: "assets/oran/1.png"),
    Categories(text: "الاخبار", path: "assets/oran/4.png"),
    Categories(text: "التقويم", path: "assets/oran/3.png"),
    Categories(text: "الوثائق", path: "assets/oran/5.png"),
  ];

  Widget _categories() {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Expanded(child: Container()),
            Text("جميع الفئات",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: [
              for (int i = 0; i < categoriesList.length; i++)
                InkWell(
                  onTap: (){
                    if(categoriesList[i].text=="مواعيد"){
                      Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RdvView()));
                    }
                       if(categoriesList[i].text=="الوثائق"){
                      Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Edocument()));
                    }
                     if(categoriesList[i].text=="التقويم"){
                      Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CustomCalendar()));
                    }
                       if(categoriesList[i].text=="الاخبار"){
                      Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => News()));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.5, horizontal: 10),
                    width: width * 0.4,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                        color: Color(0xffEFF4F7),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Image.asset(
                          categoriesList[i].path,
                          width: 45,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          categoriesList[i].text,
                          style: categoriesStyle,
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _notificationWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(children: [
        Row(
          children: [
            Text("07-11-2024"),
            Expanded(child: Container()),
            Text(
              "سونلغاز",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        Text(
          "يجب السداد فاتورة الكهرباء مستحقة قريبًا قبل 20 ديسمبر لتجنب غرامات التأخير",
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.right,
        )
      ]),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
    );
  }

  Widget entitieWidget() {
    return Container(
      width: width,
      child: Row(
        children: [
          Image.asset("assets/oran/notification.png", width: 40, height: 40),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("دهية لعناصري",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 4,
              ),
              Text(
                "الجزائر",
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/oran/person.png",
            height: 45,
            width: 45,
          )
        ],
      ),
    );
  }
}
