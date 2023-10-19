import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/screens/login/login_screen.dart';
import 'package:todo_app/shared/styles/myThemedata.dart';
import 'layout/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseFirestore.instance.disableNetwork();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MyProvider()),
  ], child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pro.languageCode),
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      initialRoute: pro.firebaseUser !=null ?
          HomeLayout.routeName
      :LoginScreen.routeName,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
        SplashScreen.routeName:(context)=>SplashScreen(),
        LoginScreen.routeName:(context) => LoginScreen()
        },
      themeMode: ThemeMode.dark,
      darkTheme: MyThemeData.darkTheme,

    );
  }
}
