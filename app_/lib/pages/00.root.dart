import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/CustomWidget.dart';

class RootPages extends StatefulWidget {
  const RootPages({super.key});

  @override
  State<RootPages> createState() => _RootPagesState();
}

class _RootPagesState extends State<RootPages> {
  Size size = Size(0, 0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: ListView(
              children: [
                Container(
                    //title
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: size.height * .1,
                    width: size.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "성공회대학교 날씨제공 서비스",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w100),
                            ),
                            Text(
                              "KURUMI",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 3,
                          width: 1,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.notifications,
                            size: 50,
                            color: Colors.amber,
                          ),
                        )
                      ],
                    )),
                Container(
                  // 뭐 이상한 공지들임
                  height: size.height * .08,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.circle_notifications,
                          color: Colors.amber,
                          size: 48,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "이것이 너가 원하던 공지들입니다.",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  // 날씨 알려줌
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: size.height * .35,
                  //margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Text(
                            "   ㅁ in skhu weather",
                            textAlign: TextAlign.start,
                          )),
                      Flexible(
                        // 아이콘, 도
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 6,
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "27'",
                                      style: TextStyle(
                                          fontSize: 100,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: ""),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "c",
                                        style: TextStyle(fontSize: 60),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.circle,
                                  size: 125,
                                  color: Colors.amber,
                                ),
                                width: size.height * .13,
                                height: size.height * .15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "   강수확률 : 몰?루",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "   습도 : 몰?루",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "현재 성공회대생이 응답한 날씨는...    \n몰?루 입니다.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.circle,
                                size: 80,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //이후 날씨 알려줆
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: size.height * .2,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "오후 00시",
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.nightlight,
                              size: 80,
                              color: Colors.amber[200],
                            ),
                            Text(
                              "22도",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "10%",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 3,
                        width: 1,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "오후 00시",
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.circle,
                              size: 80,
                              color: Colors.amber[200],
                            ),
                            Text(
                              "22도",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "10%",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 3,
                        width: 1,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "오후 00시",
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.circle,
                              size: 80,
                              color: Colors.amber[200],
                            ),
                            Text(
                              "22도",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "10%",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: size.height * .075,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      children: [
                        btn(),
                        SizedBox(
                          width: 10,
                        ),
                        btn(),
                      ],
                    ))
              ],
          )),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              width: size.width,
              padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
              height: size.height *.1,
              decoration: BoxDecoration(
              color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)
              ),
              child: ElevatedButton(
                child: Text(
                  "몰루한 몰루몰루",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.blue[200]
                  )
                ),
              )
            ),
          )
        ],
      ),
      /*body: */
    );
  }
}

//bottom sheet
class _BottomSheet extends StatefulWidget {
  const _BottomSheet({super.key});

  @override
  State<_BottomSheet> createState() => __BottomSheetState();
}

class __BottomSheetState extends State<_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
