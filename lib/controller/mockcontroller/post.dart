import 'package:first_provider_hero/api/api_base.dart';
import 'package:flutter/material.dart';

class postApi extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();

  bool isLoading = false;
  String isError = '';
  ApiBase apiBase = ApiBase();

  Future<void> postData(
      {required BuildContext context,
      required String name,
      String? address,
      String? city,
      }) async {
        isLoading=true;
        notifyListeners();
    final parameters = {
      "name": name,
      "address": address,
      "city": city,
    
    };
    try{
      await apiBase.post(
        'https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi',
        parameters,
        (data) {
         // isLoading=true;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Post Successfully..')));
        },
        (error) {
         // isLoading=false;
          isError =error.toString();
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error posting data :$isError")));
        });
    } catch (error){
     // isLoading=false;
      isError = error.toString();
      notifyListeners();
    }
  }
}
