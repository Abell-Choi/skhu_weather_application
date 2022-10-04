import 'package:flutter/material.dart';

Widget btn(){
  return OutlinedButton.icon(
    onPressed: (){}, 
    icon: Icon(Icons.heart_broken, color: Colors.red,), 
    label: Text('test')
  );
}