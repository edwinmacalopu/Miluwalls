import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/bloc.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/widgets/category.dart';
import 'package:miluwallpaper/utils/themes.dart';
import 'package:provider/provider.dart';
class CategoryPage extends StatefulWidget {
   
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Collection> categ=[];
  final prueba=BloC();
   addData()async{
     prueba.getCategory();
   }
  @override
  void initState() {    
    super.initState();
    addData();
  }
  Widget build(BuildContext context) {
    final category =Provider.of<BloC>(context); 
         // print(category.isdart);   
       return  StreamBuilder(
            stream: category.streamTheme,
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
          stream: prueba.streamCategory,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            
           if(snapshot.hasData){
             List<Collection> catg=snapshot.data;
             print(catg.length);
              return Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                      child:Category(category: catg)
                     
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