import 'package:flutter/material.dart';
import 'bloc/provider.dart';
import 'package:miluwallpaper/pages/navbar.dart'; 
void main() => runApp(
  MaterialApp(
  theme: ThemeData(
           
          toggleableActiveColor: Colors.blueAccent,
          focusColor: Colors.blueAccent,
          primaryColor: Colors.blueAccent
        ),

        home: MyApp(),
)
  
    /* routes: <String, WidgetBuilder> {
    '/registratarj': (BuildContext context) =>  Tarjetametro(saldo: null,registrado: null,),
    '/home' : (BuildContext context) => MetroHome(),}   */
     
    ); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider( //This will provide access to the Bloc instance to the whole widget tree
      child: MaterialApp(
        home: Navbar(),
      ),
    );
  }
}