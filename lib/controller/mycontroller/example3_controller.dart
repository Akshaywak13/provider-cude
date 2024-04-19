import 'package:flutter/material.dart';

class Example3Provider extends ChangeNotifier{

  TextEditingController name = TextEditingController();
  String nameValue ="";
  String get getNameValue => name.text;

  void setNameValue(){
  nameValue = name.text;
 // name.clear();
  notifyListeners();
  
  }
}