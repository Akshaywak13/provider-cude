import 'package:first_provider_hero/controller/mockcontroller/put.dart';
import 'package:first_provider_hero/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutScreen extends StatelessWidget {
  final UserModel data ;
  const PutScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    
    final putProvider = Provider.of<putApi>(context);

    putProvider.nameput.text = data.name ?? "";
    putProvider.Addressput.text = data.address ?? "";
    putProvider.Cityput.text = data.city ?? "";
    putProvider.idput.text = data.id ??"";
    
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(8),
child: ListView(
  children: [
    TextFormField(
     controller: putProvider.nameput,
      decoration: const InputDecoration(
        hintText: "Name",
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    ),
    TextFormField(
      controller:putProvider.Addressput ,
      decoration: const InputDecoration(
        hintText: "Address",
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    ),
     TextFormField(
      controller:putProvider.Cityput ,
      decoration: const InputDecoration(
        hintText: "City",
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    ),
    const SizedBox(height: 20,),
    ElevatedButton(onPressed: ()async{
      await putProvider.putData(context: context, name: putProvider.nameput.text, address: putProvider.Addressput.text,city: putProvider.Cityput.text, id: putProvider.idput.text);
    },
     child: const Text("Save"))
  ],
),
),
    );
  }
}