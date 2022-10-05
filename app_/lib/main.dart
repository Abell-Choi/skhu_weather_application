import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './utility/GetX_Controller.dart';

// pages
import './pages/00.root.dart';
void main() {
  runApp(const GetMaterialApp(home: RootPage()));
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AppController _c = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(() { 
          if (_c.isConnectedData.value) {
            return RootPages();
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://media.tenor.com/aGkPv_YWJe0AAAAd/blue-archive-izuna.gif'
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          }
        }
    );
  }
}