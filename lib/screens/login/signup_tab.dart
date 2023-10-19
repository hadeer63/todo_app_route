import 'package:flutter/material.dart';

class SignUpTab extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var ageController=TextEditingController();
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
                  decoration: const InputDecoration(
                    labelText:"e-mail",
                  ),
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return "please enter your e-mail";
                    }
                    return null;
                  }

              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText:"e-mail",
                  ),
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return "please enter your e-mail";
                    }
                    return null;
                  }

              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText:"e-mail",
                  ),
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return "please enter your e-mail";
                    }
                    return null;
                  }

              ),
              TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText:"password",
                  ),
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return "please enter your password";
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
