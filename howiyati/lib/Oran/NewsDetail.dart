import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsDetail();
  }
}

class _NewsDetail extends State<NewsDetail> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("الاخبار البارزة"),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/oran/bgimage.png",
                            width: width,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Image.asset(
                              "assets/oran/text.png",
                              width: width,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ]),
                  ),
                 Positioned(
  bottom: 20,
  left: 0, // Optional: if you want it aligned to the left of the screen
  right: 0, // Make sure the `Container` doesn't take full width and stays centered
  child: Align(
    alignment: Alignment.bottomCenter, // Align the container in the center horizontally
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adjust row size to fit content
        mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
        crossAxisAlignment: CrossAxisAlignment.center, // Center content vertically
        children: [
          InkWell(child: Image.asset("assets/oran/bookmark.png", width: 20)),
          SizedBox(width: 25),
          InkWell(child: Image.asset("assets/oran/share.png", width: 25)),
        ],
      ),
    ),
  ),
)

                ],
              ))),
    );
  }
}
