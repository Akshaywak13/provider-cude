import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier{


  double _sliderValue = 10;

  double get getSliderValue=> _sliderValue;

  void setSliderValue(double value){
    _sliderValue = value;
    notifyListeners();
    print(value);
  }
}