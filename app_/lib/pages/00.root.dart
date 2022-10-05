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
                title(
                  size,
                  "KURUMI",
                  subtitle: "성공회대학교 날씨제공 서비스",
                ),
                notiContainer(size, "선생님의 도움이 필요해요"),
                weatherContainer(size, weatherType: -1, rainRaiting: 74,waterProof: 100),
                afterWeather(size),
                someButton(size),
              ],
          )),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: bottomSheetButton(size),
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
