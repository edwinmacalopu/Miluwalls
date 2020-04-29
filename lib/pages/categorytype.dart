import 'package:flutter/material.dart';
//import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/utils/themes.dart';
import 'package:miluwallpaper/widgets/categorylistitem.dart';
import 'package:provider/provider.dart';
class CategoryType extends StatelessWidget {
 final String tipocateg;
CategoryType({Key key, this.tipocateg}) : super(key: key);
Widget build(BuildContext context) {
   
    return  Consumer<bool>(
    builder: (_ ,snapshot ,__)=>Theme(
    data:snapshot
    ? AppTheme.darkTheme
    : AppTheme.lightTheme,                 
          child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        title:Text(tipocateg)        
        ),
        body: 
         Consumer<List>(
          builder: (_ ,snapshot ,__){
            //List<Wallpaper> lista=snapshot;
            if(snapshot.length==0){
              return Center(child: CircularProgressIndicator(),);
              }else{
                 return Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:CategoryListitem(walls: snapshot,itemcateg:tipocateg)   
                );   
              }
            
           // print("NO EXISTEEEEEEEEEEEEEEEEEE");
                  
    } 
   )
     /*StreamBuilder(
          stream: resapi.streamwalls,
          builder: (BuildContext context, AsyncSnapshot snapshot){
           if(snapshot.hasData){
            List<Wallpaper> fe=snapshot.data;
            print(fe.length);
            print("NO EXISTEEEEEEEEEEEEEEEEEE");
              return Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:CategoryListitem(walls: fe,itemcateg:tipocateg)   
                );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
            
          },
        )*/
   )));
}
}