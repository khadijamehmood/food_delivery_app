//import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets/Big_Text.dart';
import 'package:food_delivery_app/Widgets/Small_Text.dart';
import 'package:food_delivery_app/Widgets/text_icon_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curpagevalue = 0.0;
  double scalefactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curpagevalue = pageController.page!;
      });
    });
  }

  @override
  dynamic dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          // color: Colors.blue,
          height: 300,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildpageitem(position);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _curpagevalue,
          decorator: DotsDecorator(
            activeColor: Colors.blue,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "popular"),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "food pairing",
                  color: Colors.black26,
                ),
              ), //list of food and images
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                    );
                  })
            ],
          ),
        )
      ],
    );
  }

  Widget _buildpageitem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _curpagevalue.floor()) {
      var curscale = 1 - (_curpagevalue - index) * (1 - scalefactor);
      var curtrans = _height * (1 - curscale) / 2;
      matrix = Matrix4.diagonal3Values(1, curscale, 1)
        ..setTranslationRaw(0, curtrans, 0);
    } else if (index == _curpagevalue.floor() + 1) {
      var curscale =
          scalefactor + (_curpagevalue - index + 1) * (1 - scalefactor);
      var curtrans = _height * (1 - curscale) / 2;
      matrix = Matrix4.diagonal3Values(1, curscale, 1)
        ..setTranslationRaw(0, curtrans, 0);
    } else if (index == _curpagevalue.floor() - 1) {
      var curscale = 1 - (_curpagevalue - index) * (1 - scalefactor);
      var curtrans = _height * (1 - curscale) / 2;
      matrix = Matrix4.diagonal3Values(1, curscale, 1)
        ..setTranslationRaw(0, curtrans, 0);
    } else {
      var curscale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curscale, 1)
        ..setTranslationRaw(0, _height * (1 - scalefactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFFF9000),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/neut.jpg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BigText(text: "Chinese Side"),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: Colors.cyan,
                                      size: 15,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(width: 10),
                          SmallText(text: "1237"),
                          SizedBox(
                            width: 5,
                          ),
                          SmallText(text: "comments"),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            TextAndIcon(
                                icon: Icons.circle_sharp,
                                text: "  Normal",
                                iconcolor: Colors.amber),
                            //TextAndIcon(icon: Icons.circle_sharp, text: "Normal", iconcolor: Colors.amber),
                            TextAndIcon(
                                icon: Icons.location_on,
                                text: "1.37m",
                                iconcolor: Colors.cyan),
                            TextAndIcon(
                                icon: Icons.access_time_rounded,
                                text: "32min",
                                iconcolor: Colors.red),
                          ],
                        )
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
