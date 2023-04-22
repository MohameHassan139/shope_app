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
  var formkey = GlobalKey<FormState>();
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
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: double.infinity,
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
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  defaultTextFormField(
                                    labelText: 'email',
                                    textController: controllerEmail,
                                    prefixIcone: Icons.email,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultTextFormField(
                                    validater: (value) {
                                      if (value == null) {
                                        return 'should enter email';
                                      }
                                      return null;
                                    },
                                    isPassword: true,
                                    labelText: 'password',
                                    textController: controllerPassword,
                                    prefixIcone: Icons.lock,
                                    suffix: Icons.remove_red_eye,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! LoginLoadingState,
                                    builder: (context) => defaultButton(
                                      onPressed: () {
                                        if(formkey.currentState!.validate()){
                                        print('buttom!!!!!!!!!!!');
                                        print(controllerEmail.text);
                                        print(controllerPassword.text);
                                        LoginCubit.get(context).login(
                                          email: controllerEmail.text,
                                          password: controllerPassword.text,
                                        );}
                                      },
                                      text: 'LOGIN',
                                    ),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const Text('you don\'t have account'),
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
              ),
            );
          }),
    );
  }
}
