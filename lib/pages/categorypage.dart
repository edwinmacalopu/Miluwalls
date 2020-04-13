import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/provider.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/widgets/category.dart';
import 'package:miluwallpaper/utils/themes.dart';
class CategoryPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    final category =Provider.of(context);
    final bool the=category.isdart;
    print("categoriaaaaaaaaaaaaa"+the.toString());
    category.getCategory(context);
    //_bloc.getwalls();
  //  print(_bloc.isdart);
    return  StreamBuilder(
            stream: category.streamTheme,
            initialData: false,
              builder: (context, snapshot) => Theme(
              data: snapshot.hasData && snapshot.data
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
                    
          child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        title:Text('Category')        
        ),
        body: 
        StreamBuilder(
          stream: category.streamCategory,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print("llama stream");
           if(snapshot.hasData){
             List<Collection> catg=snapshot.data;
              return Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                      child:Category(category: catg,theme: the)
                     
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