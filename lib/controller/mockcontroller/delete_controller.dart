import 'package:first_provider_hero/api/api_base.dart';
import 'package:flutter/material.dart';

class deleteController extends ChangeNotifier {
  TextEditingController id = TextEditingController();


  bool isLoading = false;
  String isError = '';
  ApiBase apiBase = ApiBase();

  Future<void> deleteData({required BuildContext context, required String id}) async {
        isLoading=true;
        notifyListeners();
  
    try{
      await apiBase.delete(
        'https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi/$id',
      
        (data) {
         // isLoading=true;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Delete Successfully..')));
        },
        (error) {
         // isLoading=false;
          isError =error.toString();
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Delete data :$isError")));
        });
    } catch (error){
     // isLoading=false;
      isError = error.toString();
      notifyListeners();
    }
  }
}
