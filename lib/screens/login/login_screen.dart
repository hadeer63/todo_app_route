import 'package:flutter/material.dart';
import 'package:todo_app/screens/login/login_tab.dart';
import 'package:todo_app/screens/login/signup_tab.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName='login';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            bottom: TabBar(tabs: [
              Tab(
                child: Text("Login"),
              ), Tab(
                child: Text("SignUp"),
              ),

            ]),
          ),
          body: TabBarView(children:[
            LoginTab(),
            SignUpTab(),
          ]
          ),
        ));
  }
}
