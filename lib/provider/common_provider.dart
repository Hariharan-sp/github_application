import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_application/services/search_services.dart';

import '../model/user_response_model.dart';
import '../screens/dashboard_page.dart';

class CommonProvider extends ChangeNotifier {
  UserDataResponseModel? userDataResponseModel;
  bool inProgress = false;

  changeProgress(bool value) {
    inProgress = value;
    notifyListeners();
  }

  void getUserData(String username, BuildContext context) {
    changeProgress(true);
    ApiService.getData(username).then((value) {
      if (value != null) {
        userDataResponseModel = value;
        changeProgress(false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      } else {
        changeProgress(false);
        showToast();
      }
    });
  }


  void showToast() {
    Fluttertoast.showToast(
        msg: "Invalid user",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
