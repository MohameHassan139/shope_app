import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/cubit/login_states.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/shared/network/local/componant/button.dart';
import 'package:shop_app/shared/network/local/componant/navigate_to.dart';
import 'package:shop_app/shared/network/local/componant/text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../../shared/network/local/componant/textfromfield.dart';
import 'cubit/login_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        height: 450,
                        width: 350,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(198, 218, 218, 133),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                defaultTextFormField(
                                  labelText: 'email',
                                  textController: controllerEmail,
                                  prefixIcone: Icons.email,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultTextFormField(
                                  validater: (p0) {
                                    if (p0?.isEmpty == true) {
                                      return 'should enter email';
                                    }
                                  },
                                  isPassword: true,
                                  labelText: 'password',
                                  textController: controllerPassword,
                                  prefixIcone: Icons.remove_red_eye,
                                  suffix: Icons.remove_red_eye,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ConditionalBuilder(
                                  condition: state is! LoginInatialState,
                                  builder: (context) => defaultButton(
                                    onPressed: () {
                                      LoginCubit.get(context).login(
                                        email: controllerEmail.text,
                                        password: controllerPassword.text,
                                      );
                                    },
                                    text: 'LOGIN',
                                  ),
                                  fallback: (context) => Center(
                                      child: CircularProgressIndicator()),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Text('you don\'t have account'),
                                    defuiltTextButtom(
                                      onpressed: () {
                                        navigateTo(
                                            context: context,
                                            wiget: RegisterScreen());
                                      },
                                      text: 'register',
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
