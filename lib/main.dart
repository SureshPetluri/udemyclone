
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone_ui/routes/appPages.dart';
import 'package:udemy_clone_ui/routes/appRoutes.dart';
import 'package:udemy_clone_ui/signin/signin_view.dart';

import 'details/details_screen.dart';
import 'home/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(
            context); // Obtain the current media query information.
        return MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1.0),
            // Set the default textScaleFactor to 1.0 for the whole subtree.
            child: child!);
      },
      debugShowCheckedModeBanner: false,
      theme: buildTheme(context),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.home,
      // home: HomeScreen(),
    );
  }

  ThemeData buildTheme(BuildContext context) {
    var themeData = Theme.of(context);
    return themeData.copyWith(
      appBarTheme: buildAppBarTheme(themeData),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: buildInputDecorationTheme(themeData),
      checkboxTheme: themeData.checkboxTheme.copyWith(
          fillColor: MaterialStateColor.resolveWith(
                  (_) => Colors.blue)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blue)),
      ),
      colorScheme:
      ColorScheme.light().copyWith(primary: Color(0xff8A8686)),
    );
  }

  AppBarTheme buildAppBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      titleSpacing: 5.0,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      color: Color(0xfff5f8ff),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      toolbarTextStyle: TextStyle(color: Colors.black),
    );
  }

  InputDecorationTheme buildInputDecorationTheme(ThemeData themeData) {
    return themeData.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: Color(0xffE9EFFF),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),

      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      // hintStyle: AppTextTheme.robotoHintTextStyle,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
    );
  }
}
