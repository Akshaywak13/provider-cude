import 'package:first_provider_hero/controller/mockcontroller/get.dart';
import 'package:first_provider_hero/controller/mockcontroller/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<postApi>(context);
    final getProvider = Provider.of<getApi>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: postProvider.name,
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: postProvider.Address,
                decoration: const InputDecoration(
                  hintText: 'Enter Address',
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: postProvider.City,
                decoration: const InputDecoration(
                  hintText: 'Enter City',
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
             
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await postProvider.postData(
                    context: context,
                    name: postProvider.name.text,
                   address: postProvider.Address.text,
                   city: postProvider.City.text
                  );

                  // Refresh data after posting
                  await getProvider.getAllData();
                },
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
