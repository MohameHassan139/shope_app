import 'package:flutter/material.dart';
import 'package:shop_app/shared/network/local/componant/button.dart';

import '../../shared/network/local/componant/textfromfield.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 400,
                width: 300,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultTextFormField(
                          labelText: 'email',
                          textController: controllerEmail,
                          prprefixIcon: Icons.email,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                          validater: (p0) {
                            if (p0 == null) {
                              return 'should enter email';
                            }
                          },
                          isPassword: true,
                          labelText: 'password',
                          textController: controllerPassword,
                          prprefixIcon: Icons.lock,
                          suffix: Icons.remove_red_eye,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                          onPressed: () {
                            //TODO
                          },
                          text: 'LOGIN',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text('you don\'t have account'),
                            TextButton(
                              onPressed: () {
                                //TODO
                              },
                              child: Text('Regist'),
                            )
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
  }
}
