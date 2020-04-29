import 'package:flutter/material.dart';
 
class AppTheme { 
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blueAccent,
    canvasColor: Colors.white,
    //accentColor: Colors.blueAccent,
    scaffoldBackgroundColor: Color.fromRGBO(252, 254, 255, 1.0),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
         title: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
      ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black54,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      display1:TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold
      ), 
      title: TextStyle(
        color: Colors.black45,
        fontSize: 20.0,
      ),
      subtitle: TextStyle(
        color: Colors.black45,
        fontSize: 18.0,
      ),
    ),
   
    
  );
 
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 26, 31, 51),
    primaryColor: Colors.blueAccent,
     canvasColor:  Color.fromARGB(255, 26, 31, 51),
    disabledColor: Colors.white,
    appBarTheme: AppBarTheme(
      color:  Color.fromARGB(255, 26, 31, 51),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color:  Color.fromARGB(255, 26, 31, 51),
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    
    textTheme: TextTheme(  
      display1:TextStyle(
        color: Colors.white,
        fontSize: 15.0,
        fontWeight: FontWeight.bold
      ),    
      headline: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),    
      overline: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      caption: TextStyle(
        color:Colors.white
      ),
      subtitle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      
    ),
    
      
  );
}