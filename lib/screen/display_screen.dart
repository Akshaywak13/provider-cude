import 'package:first_provider_hero/controller/mockcontroller/delete_controller.dart';
import 'package:first_provider_hero/controller/mockcontroller/get.dart';
import 'package:first_provider_hero/screen/add.dart';
import 'package:first_provider_hero/screen/put_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<getApi>(context, listen: false).getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
      final deleteProvider =Provider.of<deleteController>(context);

    final apiProvider = Provider.of<getApi>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Screen"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddScreen()));
      },
      child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: deleteProvider.id,
                decoration: const InputDecoration(
                  hintText: 'id'
                ),
              ),
            ),
            ElevatedButton(onPressed: ()async{
              await deleteProvider.deleteData(context: context, id: deleteProvider.id.text);
            },
             child: const Text('Delete Data')),

            Consumer<getApi>(builder: (context, value, child) {
  if (value.isLoading) {
    return const Center(child: CircularProgressIndicator());
  } else if (value.error != null) {
    return Center(child: Text('Error: ${value.error}'));
  } else {
    return Expanded(
      child: ListView.builder(
        itemCount: value.userList.length,
        itemBuilder: (context, index) {
          final data = value.userList[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PutScreen(data: data)));
              },
              child: Card(
                child: Column(
                  children: [
                    Text(data.name ?? ""),
                    Text(data.id ?? ''),
                    Text(data.address??""),
                    Text(data.city??"")
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
})

          ],
        ),
      ),
    );
  }
}
