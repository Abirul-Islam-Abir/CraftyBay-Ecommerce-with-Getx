import '../utils/export.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness
        .light, //Setting the Brightness to light  so that this can be used as Light ThemeData
    scaffoldBackgroundColor: Colors.white,
   /* textTheme: CustomTextTheme.textThemeLight,*/

    appBarTheme:globalAppBarTheme(),
  /*  const AppBarTheme(
      backgroundColor: Colors.deepOrange,
      elevation: 0,
      centerTitle: true,
    ),*/
    elevatedButtonTheme:globalElevatedButtonStyle(),
   /* ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        )),*/
  );
}