import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/provider.dart';
import 'package:miluwallpaper/widgets/categorylistitem.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/utils/themes.dart';
class CategoryType extends StatelessWidget {
final String tipocateg;
final bool theme;
  const CategoryType({Key key,@required this.tipocateg,@required this.theme}) : super(key: key);
    @override
  Widget build(BuildContext context) {
     final categty=Provider.of(context);
      print("LISTA DE CATEGORIAS :"+categty.wall.length.toString());
    return  Theme(
              data: theme
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
                    
          child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        title:Text(tipocateg)        
        ),
        body: 
        StreamBuilder(
          stream: categty.streamwalls,
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
        )
          )
          
    
    );
    
    
  }
}