import 'package:flutter/material.dart';

class ConterController extends ChangeNotifier{

  int count = 10;

  int get getCount => count;

  void increase (){
    count++;
    notifyListeners();
  }

  void decrease (){
    count--;
    notifyListeners();
  }
}