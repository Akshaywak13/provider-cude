import 'package:first_provider_hero/controller/mycontroller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Consumer<SliderProvider>(builder: (context,value, child){
        return  Slider(
          value: value.getSliderValue,
          onChanged: (e) {
            value.setSliderValue(e);
          },
          min: 0,
          max: 500,
        );
       }),
        SizedBox(height: 20,),
        Consumer<SliderProvider>(builder: (context, value, child){
          return Text('Slider: ${value.getSliderValue} ',style: TextStyle(fontSize: 20),);
        }),
        SizedBox(height: 20,),
        Row(
          children: [
           Consumer<SliderProvider>(builder: (context,value, child){
            return  Container(
              width: value.getSliderValue,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
            );
           })
          ],
        )
      ],
    );
  }
}
