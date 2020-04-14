import 'package:flutter/material.dart';
import 'bloc/provider.dart';
import 'package:miluwallpaper/pages/navbar.dart'; 
void main() => runApp(
  
   MyApp(),
     
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