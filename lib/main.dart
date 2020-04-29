import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/bloc.dart';
import 'package:provider/provider.dart';
import 'package:miluwallpaper/pages/navbar.dart'; 
void main() => 
runApp( MyApp(),   //MyApp(),
    ); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final provider=BloC();
    return  MultiProvider(
      providers: [
              Provider(
                create: (_)=>provider,
                dispose: (_,prov)=>prov.dispose(),
                ),
                StreamProvider(
                  create:(_)=> provider.streamTheme,
                  initialData: false,
                ),
                 StreamProvider(create: (_)=>provider.streamwalls,
                initialData: [],
                ), 
                /*StreamProvider(create: (_)=>provider.streamCount,
                initialData: 1,
                ),*/

            ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
          home: Navbar(),
         
      ),
    );
  }
}