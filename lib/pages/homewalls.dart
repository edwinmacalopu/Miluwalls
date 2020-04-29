import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/bloc.dart'; 
import 'package:miluwallpaper/models/wallpaper.dart'; 
import 'package:miluwallpaper/widgets/wallpaperlist.dart';
import 'package:miluwallpaper/utils/themes.dart';
import 'package:provider/provider.dart';
class HomeWalls extends StatelessWidget {
  
  Widget build(BuildContext context) {
  final resapi=Provider.of<BloC>(context); 
resapi.getwalls(context);
    return StreamBuilder(
            stream: resapi.streamTheme,
            //initialData: false,
              builder: (context, snapshot) => Theme(
              data: snapshot.hasData && snapshot.data
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
                    
          child: Scaffold(
        appBar: AppBar(           
          elevation: 0,
          title: Text("Miluwalls"),
                 
          ),
        body: 
        StreamBuilder(
          stream: resapi.streamwalls,
          builder: (BuildContext context, AsyncSnapshot snapshot){        
           if(snapshot.hasData){
             List<Wallpaper> fe=snapshot.data;
              return Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                    child:WallpaperList(wallplist: fe)
                   
                );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
            
          },
        )
          )
          
    )
    );
    
    
  }
 
}