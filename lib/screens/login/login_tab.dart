import 'package:flutter/material.dart';

class LoginTab extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                  decoration: const InputDecoration(
                    labelText:"e-mail",
                  ),
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return "please enter your e-mail";
                    }
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                        .hasMatch(value);
                    if(!emailValid){
                      return "please enter valid e-mail";
                    }
                    return null;
                  }

              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText:"password",
                ),
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return "please enter your password";
                    }
                    final bool passwordValid =
                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);
                    if(!passwordValid){
                      return "please enter valid password";
                    }
                    return null;
                  }
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                    // TODO: Perform login
                }
              }, child: const Text("Login")
              ),
              // const SizedBox(height: 20,),
              // TextButton(onPressed: (){},
              //     child: const Text("Don\'t have an account? SignUp"))
            ],
          )),
    );
  }
}
