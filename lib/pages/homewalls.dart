import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/bloc.dart';
import 'package:miluwallpaper/bloc/provider.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/services/api.dart';
import 'package:miluwallpaper/widgets/wallpaperlist.dart';
import 'package:miluwallpaper/utils/themes.dart';
class HomeWalls extends StatefulWidget {
  @override
  _HomeWallsState createState() => _HomeWallsState();
}

class _HomeWallsState extends State<HomeWalls>with AutomaticKeepAliveClientMixin {
  List<Wallpaper> wal=[];
  final prueba=BloC();
  /*@override
  void dispose() {
     
    super.dispose();
    _streamController.close();
  }*/
   addData()async{
     wal=await Apiwalls().getapi();
     print(wal.length);
     prueba.getwalls(wal);
   }
  @override
  void initState() {
    
    super.initState();
    addData();
  }
  Widget build(BuildContext context) {
    super.build(context);
  final resapi=Provider.of(context);
  print("redibujando");
//  resapi.getwalls(context);
   print("ENTRA AL BUILD");
    return StreamBuilder(
            stream: resapi.streamTheme,
            initialData: false,
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
          stream: prueba.streamwalls,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print("llama stream HOME");
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

  @override
   
  bool get wantKeepAlive => true;
}