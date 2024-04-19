import 'package:first_provider_hero/controller/mycontroller/conter_controller.dart';
import 'package:first_provider_hero/model/example3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final counterController =
        Provider.of<ConterController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text('Example firest'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ConterController>(builder: (context, value, child) {
                    return Text(
                      value.getCount.toString(),
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    );
                  })
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           Provider.of<ConterController>(context, listen: false)
              //               .increase();
              //         },
              //         child: Text('Add')),
              //     ElevatedButton(onPressed: () {
              //       Provider.of<ConterController>(context, listen: false).decrease();
              //     }, child: Text("Sub"))
              //   ],
              // ),
              // SizedBox(height: 20,),
              // Text('Example2'),
              // Example2(),
              SizedBox(height: 20,),
              Eexample3(),
            ],
          ),
        ),
      ),
    );
  }
}
