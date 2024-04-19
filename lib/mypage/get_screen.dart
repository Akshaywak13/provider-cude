import 'package:first_provider_hero/controller/mockcontroller/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<getApi>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await apiProvider.getAllData();
              },
              child: Text('Fetch User Data'),
            ),
            apiProvider.isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: apiProvider.userList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(apiProvider.userList[index].name ?? ''),
                          subtitle: Text(apiProvider.userList[index].address ?? ''),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              apiProvider.userList[index].id ?? '',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}