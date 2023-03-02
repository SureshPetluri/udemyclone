import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/appPages.dart';
import 'routes/appRoutes.dart';



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
      //  home: MyHomePage(),
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
      const ColorScheme.light().copyWith(primary: const Color(0xff8A8686)),
    );
  }

  AppBarTheme buildAppBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      titleSpacing: 5.0,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      color: const Color(0xfff5f8ff),
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      toolbarTextStyle: const TextStyle(color: Colors.black),
    );
  }

  InputDecorationTheme buildInputDecorationTheme(ThemeData themeData) {
    return themeData.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: const Color(0xffE9EFFF),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      // hintStyle: AppTextTheme.robotoHintTextStyle,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
    );
  }
}
