import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/services/api.dart';


class BloC{

  final _controllerTheme = StreamController<bool>.broadcast();
  final _controllernavbar = StreamController<int>();
  final _controllerwalls=StreamController<List<Wallpaper>>.broadcast();
  final _controllerCategory=StreamController<List>.broadcast();

  Stream<int> get  streamnavbar => _controllernavbar.stream;
  Stream<bool> get streamTheme => _controllerTheme.stream;
  Stream<List<Wallpaper>> get streamwalls => _controllerwalls.stream;
  Stream<List> get streamCategory =>_controllerCategory.stream;
  int navbar=0;
  bool isdart=false;
  bool updatewall =false;
  List<Collection> category=[];
  List<Wallpaper> wall=[];

  void changeTheme(){
    isdart=!isdart;
    _controllerTheme.add(isdart);
  }
  
  void changeNavbar(int page){
    print(page);
    navbar=page;
    _controllernavbar.add(navbar);
  }

  void getwalls(BuildContext context)async{
     //wall=wallp;
     wall=await Apiwalls().getapi(context);
    _controllerwalls.add(wall);
    
  }

  void getCategory()async{
  category=await Apiwalls().getcateogry();
  
    _controllerCategory.add(category);
  }
  
 void dispose(){
    _controllerTheme?.close();
    _controllernavbar?.close();
    _controllerwalls?.close();
    _controllerCategory?.close();
  }

}

