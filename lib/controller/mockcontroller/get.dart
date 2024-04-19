import 'package:first_provider_hero/api/api_base.dart';
import 'package:first_provider_hero/model/user_model.dart';
import 'package:flutter/material.dart';

class getApi extends ChangeNotifier {
  bool isLoading = false;
  List<UserModel> userList = [];
  String? error;

  ApiBase apiBase = ApiBase();

  Future<void> getAllData() async {
    isLoading = true;
    notifyListeners();
    
    try {
      await apiBase.get(
        'https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi',
        (data) {
          userList = (data as List).map((item) => UserModel.fromJson(item)).toList();
          isLoading = false;
          error = null; // Clear error
          notifyListeners();
        },
        (errorMessage) {
          isLoading = false;
          error = errorMessage; // Set error message
          notifyListeners();
        },
      );
    } catch (e) {
      isLoading = false;
      error = e.toString(); // Set error message
      notifyListeners();
    }
  }
}
