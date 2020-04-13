import 'package:http/http.dart' as http;
//import 'package:miluwallpaper/bloc/provider.dart';
import 'package:miluwallpaper/models/wallpaper.dart';

class Apiwalls{
  
    List<Wallpaper> walls=[];
    List<Collection> categorys=[];
  Future<List> getapi()async{
    //final wall=Provider.of(context);
    print("ENTRAAAAAA AL FUTURE");
    //if(wall.wall.length!=0){
   // return wall.wall;
  //  }else{
    final url='https://raw.githubusercontent.com/edwinmacalopu/wxllpaper/master/creative.json';
    final response=await http.get(url);
    if(response.statusCode==200){
     walls=wallpapersmodelsFromJson(response.body).wallpapers; 
     
     print(walls[24].url);  
     print("LLAMA AL API"); 
     //print("llena bloc");
    // print("se oejecuto"+bloc.updatewall.toString());
      //Wallpaper wallpaper=Wallpaper.fromJson(json);
      //print(wallpaper.author);
    }
    return walls;
    }
    
  }

 /* Future<List> getcateogry(BuildContext context)async{
    final category=Provider.of(context);
    print("ENTRAAAAAA AL CATEGORY");
    if(category.category.length!=0){
    return category.category;
    }else{
    final url='https://raw.githubusercontent.com/edwinmacalopu/wxllpaper/master/creative.json';
    final response=await http.get(url);
    if(response.statusCode==200){
    // categorys=wallpapersmodelsFromJson(response.body).collections;        
   //  print(categorys[1].name);  
     print("LLAMA AL API CATEGORY"); 
     //print("llena bloc");
    // print("se oejecuto"+bloc.updatewall.toString());
      //Wallpaper wallpaper=Wallpaper.fromJson(json);
      //print(wallpaper.author);
    }
   // return categorys;
   return null;
    }
  
 // }
}*/