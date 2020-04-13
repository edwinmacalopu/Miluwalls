import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = BloC();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static BloC of(BuildContext context) {
   return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
   
  }

   
   
}