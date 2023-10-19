import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/provider/my_provider.dart';

import '../../firebase/firebase_functions.dart';

class LoginTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "e-mail",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your e-mail";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "please enter valid e-mail";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your password";
                    }
                    final bool passwordValid = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value);
                    if (!passwordValid) {
                      return "please enter valid password";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseFunctions.login(
                          emailController.text, passwordController.text,
                          () {
                            pro.initUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeLayout.routeName, (route) => false,);
                      }, (errorMessage) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error"),
                            content: Text(errorMessage),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Okay"))
                            ],
                          ),
                        );
                      });
                      // .
                      // then((value) {
                      //   Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
                      //     });
                    }
                  },
                  child: const Text("Login")),
              // const SizedBox(height: 20,),
              // TextButton(onPressed: (){},
              //     child: const Text("Don\'t have an account? SignUp"))
            ],
          )),
    );
  }
}
