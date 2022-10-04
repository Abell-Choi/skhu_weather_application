import 'package:get/get.dart';


class AppController extends GetxService{
  var isConnectedData = false.obs;
  
  @override
  void onInit(){
    initialize();
    super.onInit();
  }

  Future<void> initialize() async{
    print("adsf");
    await Future.delayed(Duration(seconds: 1));
    print("ok");
    this.isConnectedData.value = true;
    return;
  }
}