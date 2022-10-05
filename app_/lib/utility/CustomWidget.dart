import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:get/get.dart';
import '../pages/01.feedback.dart';

Widget btn() {
  return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.heart_broken,
        color: Colors.red,
      ),
      label: Text('test'));
}

//to do
//making function for widget constructor
Widget title(Size size, String title,
    {String subtitle = '', IconData notification = Icons.notifications}) {
  return Container(
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
                subtitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
            onPressed: () {
              Get.to(HelpingForBlueArchive());
            },
            child: Icon(
              notification,
              size: 50,
              color: Colors.amber,
            ),
          )
        ],
      ));
}

Widget notiContainer(Size size, String noti_String){
  return Container(             // 뭐 이상한 공지들임
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
            noti_String,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}



Widget weatherContainer(
  Size size,
  {
    int temp = 69,
    int weatherType = 0,
    int rainRaiting = 0,
    int waterProof = 0,
    String mention = '현재 성공회대생이 응답한 날씨는 \n몰?루 입니다.'
  }
){

  List<dynamic> _weather = [
    BoxedIcon(WeatherIcons.day_sunny, size: 80, color: Colors.amber,),
    
    BoxedIcon(WeatherIcons.day_sunny_overcast, size: 80, color: Colors.white,),

    BoxedIcon(WeatherIcons.cloud, size: 80, color: Colors.grey,),

    BoxedIcon(WeatherIcons.rain, size: 80, color: Colors.grey,),

    BoxedIcon(WeatherIcons.snow, size: 80, color: Colors.black,),
  
    BoxedIcon(WeatherIcons.storm_warning, size: 80, color: Colors.black,),
  ];
  return Container(
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
                        "${temp}'",
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
                  child: weatherType==-1?Image.network('http://cdn.gameple.co.kr/news/photo/202111/200377_200534_83.gif'):_weather[weatherType],
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
                "   강수확률 : ${rainRaiting} %",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "   습도 : ${waterProof} %",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "\n${mention}",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              SizedBox(width: 60,),
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
  );
}

Widget afterWeather(
  Size size,
  {
    List<int>? time = null,
    List? iconType = null,
    List? temp = null,
    List? waterProof = null

  }  
){

  time ??= [999, 999, 999];
  String ahru = 'https://w.namu.la/s/484448fa19c942edaba44f77f399ec8fbc73293e3f7f1fe4bf2881c1be74c1c48d44837f2b66aec850b5594fbd711bbaec172740414bba75e82282369ae39c9fa63d5c4391400528ad9ba4f5cc7d5a08e749a66e2d4261c99e6db7ca58bf01ad';
  iconType ??= [
    Image.network(ahru,width: 100,),
    Image.network(ahru,width: 100,),
    Image.network(ahru,width: 100,),
    BoxedIcon( WeatherIcons.day_sunny, size: 50, color: Colors.amber,),
    BoxedIcon( WeatherIcons.day_sunny, size: 50, color: Colors.amber,),
    BoxedIcon( WeatherIcons.day_sunny, size: 50, color: Colors.amber,),
  ];
  temp ??= [0,0,0];
  waterProof ??= [0,0,0];
  return Container(
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
                time[0]>=12?"오후 ${time[0]}시" : "오전 ${time[0]}시",
                style: TextStyle(fontSize: 20),
              ),
              iconType[0],
              Text(
                "${temp[0]} 도",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${waterProof[0]} %",
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
                time[1]>=12?"오후 ${time[1]}시" : "오전 ${time[1]}시",
                style: TextStyle(fontSize: 20),
              ),
              iconType[1],
              Text(
                "${temp[1]} 도",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${waterProof[1]} %",
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
        ),Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time[0]>=12?"오후 ${time[2]}시" : "오전 ${time[2]}시",
                style: TextStyle(fontSize: 20),
              ),
              iconType[2],
              Text(
                "${temp[2]} 도",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${waterProof[2]} %",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget someButton(Size size) {
  return Container(
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
      ));
}

Widget bottomSheetButton(Size size) {
  return Container(
      width: size.width,
      padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
      height: size.height * .1,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        child: Text(
          "몰루한 몰루몰루",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue[200])),
      ));
}
