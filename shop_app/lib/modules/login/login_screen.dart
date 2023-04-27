import 'package:flutter/material.dart';
import 'package:shop_app/controller/login_controller.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/shared/network/local/componant/button.dart';
import 'package:shop_app/shared/network/local/componant/text_button.dart';
import '../../shared/network/local/componant/textfromfield.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(), permanent: true);
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
                    child: GetBuilder<LoginController>(
                      builder: (c) => Column(
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
                                validater: (Value) {
                                  if (Value?.isEmpty == true) {
                                    return 'enter mail';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultTextFormField(
                              validater: (value) {
                                if (value!.isEmpty) {
                                  return 'should enter password';
                                }
                                return null;
                              },
                              isPassword: controller.isPassword.isTrue,
                              labelText: 'password',
                              textController: controllerPassword,
                              prefixIcone: Icons.lock,
                              suffix: IconButton(
                                onPressed: () {
                                  controller.showPassword();
                                },
                                icon: Icon(controller.icon),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: controller.state.isTrue,
                              builder: (context) => defaultButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    controller.postdata(
                                      email: controllerEmail.text,
                                      password: controllerPassword.text,
                                    );
                                    Fluttertoast.showToast(
                                        msg: controller.loginModel.message,
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 5,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    print(controller.loginModel.message);
                                  }
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
                                    Get.to(const RegisterScreen());
                                  },
                                  text: 'register',
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
