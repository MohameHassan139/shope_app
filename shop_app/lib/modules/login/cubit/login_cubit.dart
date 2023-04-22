import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/network/remote/end_point.dart';

import 'login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInatialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void login({
    required String email,
    required String password,
  }) {
    print(email);
    print(password);
    emit(LoginLoadingState());
     DioHelper.postData(
      path: LOGIN, 
      data: {
      "email": email,
      "password": password,
    })?.then((value) {
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(
        LoginErrorState(
          error.toString(),
        ),
      );
      print(error.toString());
    });
  }
}