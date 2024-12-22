import 'package:flutter/material.dart';
import 'package:mobiurbain/Oran/RdvPresenter.dart';
import 'package:mobiurbain/utils/const.dart';
import 'package:provider/provider.dart';

class RdvView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RdvView();
  }
}

class _RdvView extends State<RdvView> {
  late double height, width;
  int selectedtab = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  late RdvPresenter rdvPresenter;
  @override
  Widget build(BuildContext context) {
    rdvPresenter = Provider.of<RdvPresenter>(context);
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "المواعيد",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 50,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        for (int i = rdvList.length - 1; i >= 0; i--) items(i),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                for (int i = 0; i < rdv[selectedtab].length; i++) tabContent(i),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int clickedIndex = -1;

  Widget tabContent(int _index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Provider.of<RdvPresenter>(context, listen: false).setShowItem(_index);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: rdvPresenter.selectedItem.isNotEmpty &&
                      rdvPresenter.selectedItem.contains(_index)
                  ? 3
                  : 0,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: selectIcon,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: width * 0.7,
                  child: Text(
                    "تم حجز موعدك بنجاح مع بريد الجزائر - استلام طرد",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
                Container(
                  width: width * 0.7,
                  child: Text(
                    "22 جانفي، الساعة 10:00 صباحًا فيفرع بريد الجزائر، حي النصر، قسنطينة",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: rdvPresenter.selectedItem.contains(_index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("موقع الاستلام: مركز الفرز"),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/oran/user.png",
                            width: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("تاريخ التسليم: 11-1-20244"),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/oran/clock.png",
                            width: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              width: width * 0.65,
                              child: Text(
                                "لم تتمكن من استلام الطرد في الوقت المحدد؟، طلب إعادة توجيه الشحنة",
                                textAlign: TextAlign.right,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/oran/information.png",
                            width: 25,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<RdvModel> rdvList = [
    RdvModel(number: 32, text: "الجميع"),
    RdvModel(number: 12, text: "البريد"),
    RdvModel(number: 12, text: "البنك"),
    RdvModel(number: 02, text: "المحكمة")
  ];

  Widget items(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedtab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(3),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Row(
            children: [
              Text(
                rdvList[index].text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selectedtab == index ? Colors.white : Colors.grey),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                rdvList[index].number.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selectedtab == index ? Colors.white : Colors.grey),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5)),
            color: selectedtab == index && index == 0
                ? Colors.orange
                : selectedtab != index
                    ? Colors.white
                    : selectIcon,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

  List<List<RdvModelDetails>> rdv = [
    [
      RdvModelDetails(
          title: "تم حجز موعدك بنجاح",
          subtitle1:
              "12 جانفي لساعة 6:00 مساءً التأكد من تفاصيل الحساب والدفعات.",
          subtitle2: "موقع الاستلام: مركز الفرز ",
          subtitle3: "تاريخ التسليم: 11-10-2024",
          subtitle4:
              "إذا لم تتمكن من استلام الطرد في الوقت المحدد، طلب إعادة توجيه الشحنة"),
      RdvModelDetails(
          title: "بريد الجزائر - استلام طرد",
          subtitle1:
              "22 جانفي، الساعة 10:00 صباحًا فيفرع بريد الجزائر، حي النصر، قسنطينة",
          subtitle2: "اقرب مؤسسة",
          subtitle3: "تاريخ التسليم: 20-12-2024",
          subtitle4: "اتصل بنا لمعرفة التفاصيل")
    ],
    [
      RdvModelDetails(
          title: "مراجعة كشف الحساب البنكي",
          subtitle1:
              "12 جانفي لساعة 6:00 مساءً التأكد من تفاصيل الحساب والدفعات.",
          subtitle2: "",
          subtitle3: "",
          subtitle4: ""),
      RdvModelDetails(
          title: "تم حجز موعدك بنجاح مع د. أحمد العلي استشارة طبية",
          subtitle1:
              "12 جانفي لساعة 6:00 مساءً التأكد من تفاصيل الحساب والدفعات.",
          subtitle2: "موقع الاستلام: مركز الفرز ",
          subtitle3: "تاريخ التسليم: 11-10-2024",
          subtitle4:
              "إذا لم تتمكن من استلام الطرد في الوقت المحدد، طلب إعادة توجيه الشحنة"),
      RdvModelDetails(
          title: "بريد الجزائر - استلام طرد",
          subtitle1:
              "22 جانفي، الساعة 10:00 صباحًا فيفرع بريد الجزائر، حي النصر، قسنطينة",
          subtitle2: "اقرب مؤسسة",
          subtitle3: "تاريخ التسليم: 20-12-2024",
          subtitle4: "اتصل بنا لمعرفة التفاصيل")
    ],
    [
      RdvModelDetails(
          title: "تم حجز موعدك بنجاح",
          subtitle1:
              "12 جانفي لساعة 6:00 مساءً التأكد من تفاصيل الحساب والدفعات.",
          subtitle2: "موقع الاستلام: مركز الفرز ",
          subtitle3: "تاريخ التسليم: 11-10-2024",
          subtitle4:
              "إذا لم تتمكن من استلام الطرد في الوقت المحدد، طلب إعادة توجيه الشحنة"),
      RdvModelDetails(
          title: "بريد الجزائر - استلام طرد",
          subtitle1:
              "22 جانفي، الساعة 10:00 صباحًا فيفرع بريد الجزائر، حي النصر، قسنطينة",
          subtitle2: "اقرب مؤسسة",
          subtitle3: "تاريخ التسليم: 20-12-2024",
          subtitle4: "اتصل بنا لمعرفة التفاصيل")
    ],
    [
      RdvModelDetails(
          title: "تم حجز موعدك بنجاح",
          subtitle1:
              "12 جانفي لساعة 6:00 مساءً التأكد من تفاصيل الحساب والدفعات.",
          subtitle2: "موقع الاستلام: مركز الفرز ",
          subtitle3: "تاريخ التسليم: 11-10-2024",
          subtitle4:
              "إذا لم تتمكن من استلام الطرد في الوقت المحدد، طلب إعادة توجيه الشحنة"),
      RdvModelDetails(
          title: "بريد الجزائر - استلام طرد",
          subtitle1:
              "22 جانفي، الساعة 10:00 صباحًا فيفرع بريد الجزائر، حي النصر، قسنطينة",
          subtitle2: "اقرب مؤسسة",
          subtitle3: "تاريخ التسليم: 20-12-2024",
          subtitle4: "اتصل بنا لمعرفة التفاصيل")
    ],
  ];
}

class RdvModelDetails {
  String title, subtitle1, subtitle2, subtitle3, subtitle4;
  RdvModelDetails(
      {required this.title,
      required this.subtitle1,
      required this.subtitle2,
      required this.subtitle3,
      required this.subtitle4});
}

class RdvModel {
  String text;
  int number;
  RdvModel({required this.number, required this.text});
}
