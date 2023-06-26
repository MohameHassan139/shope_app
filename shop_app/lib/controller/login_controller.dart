import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/shared/network/remote/http_helper.dart';

class LoginController extends GetxController {
  RxBool state = true.obs;
  RxBool isPassword = true.obs;
  IconData icon = Icons.remove_red_eye;
  late LoginInfo loginModel;
  postdata({
    required String email,
    required String password,
  }) {
    state = false.obs;
    Http.login(path: 'login', email: email, password: password)
        .then((value) async {
      state = true.obs;
      loginModel =await  LoginInfo.fromjson(value);
      print(value);
      print(loginModel.message);
      print(loginModel.data?.token);
      print(loginModel.data?.name);
      update();
    }).catchError((error){
      print(error.toString());
    });
    update();
  }

  void showPassword() {
    if (isPassword.isTrue) {
      isPassword = false.obs;
      icon = Icons.visibility_off_outlined;
    } else {
      isPassword = true.obs;
      icon = Icons.remove_red_eye;
    }
    print('showPassword @@@@');
    update();
  }
}
