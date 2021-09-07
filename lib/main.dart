import 'package:flutter/material.dart';
import 'form-creation/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Onling Shopping Application',
        theme: ThemeData(backgroundColor: Colors.grey),
        home: SafeArea(child: RegistrationForm()));
  }
}


/*
It's the main page which shows an overview on this app.
SafeArea widget has been used in homePage to wrap everything(widgets) in a screen when app implements in different screen size mobiles.
RegistrationForm() class under SafeAreaWidget extends statefullWidget which is used to take us to the form-creation pages.
*/