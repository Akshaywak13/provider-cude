import 'package:first_provider_hero/controller/mycontroller/example3_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Eexample3 extends StatelessWidget {
  const Eexample3({super.key});

  @override
  Widget build(BuildContext context) {
    final example3Provider =
        Provider.of<Example3Provider>(context, listen: false);
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: example3Provider.name,
          decoration: InputDecoration(
            fillColor: Colors.deepPurpleAccent.shade100,
            filled: true,
            hintText: "Enter Name",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              example3Provider.setNameValue();
            },
            child: Text('Done')),
        SizedBox(
          height: 20,
        ),
        Consumer<Example3Provider>(builder: (context, value, child) {
          return Text(
            "Youre name is : ${value.getNameValue}",
            style: TextStyle(fontSize: 20),
          );
        })
      ],
    );
  }
}
