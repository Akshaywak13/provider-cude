import 'package:first_provider_hero/api/api_base.dart';
import 'package:flutter/material.dart';

class putApi extends ChangeNotifier {
  TextEditingController nameput = TextEditingController();
  TextEditingController Addressput = TextEditingController();
  TextEditingController Cityput = TextEditingController();
  TextEditingController idput = TextEditingController();

  bool isLoading = false;
  String isError = '';
  ApiBase apiBase = ApiBase();

  Future<void> putData(
      {required BuildContext context,
      required String id,
      required String name,
      required String address,
      required String city,
      }) async {
        isLoading=true;
        notifyListeners();
    final parameters = {
      "id":id,
      "name": name,
      "address": address,
      "city": city,
    
    };
    try{
      await apiBase.put(
        'https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi/$id',
        parameters,
        (data) {
         // isLoading=true;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Put Successfully..')));
        },
        (error) {
         // isLoading=false;
          isError =error.toString();
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error puting data :$isError")));
        });
    } catch (error){
     // isLoading=false;
      isError = error.toString();
      notifyListeners();
    }
  }
}
