import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:miluwallpaper/bloc/bloc.dart'; 
import 'package:miluwallpaper/pages/categorypage.dart';
import 'package:miluwallpaper/pages/homewalls.dart';
import 'package:miluwallpaper/pages/settingswalls.dart';
import 'package:miluwallpaper/utils/themes.dart';
import 'package:provider/provider.dart'; 
class Navbar extends StatefulWidget {

  @override
  _NavbarState createState() => _NavbarState();
}
class _NavbarState extends State<Navbar> {
int _currentIndex = 0;
 List<Widget> screens;
  @override  
  void initState() {
    screens = [
      HomeWalls(),
      CategoryPage(),
      Settingswalls(),
      
    ];
    super.initState();
  }
@override
  Widget build(BuildContext context) {    
      final bloc=Provider.of<BloC>(context); 
    return  StreamBuilder(
    stream: bloc.streamTheme,
    builder: (context,snapshot)=>Theme(
    data:snapshot.hasData && snapshot.data
    ? AppTheme.darkTheme
    : AppTheme.lightTheme,          
         
    child:Scaffold(
    body: StreamBuilder(
    stream: bloc.streamnavbar,
    //initialData: 0 ,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      print(snapshot.data);
    return IndexedStack(
      index: _currentIndex,
      children:screens, 
      );
    },
    ),
          bottomNavigationBar:BottomNavigationBar(
            currentIndex:_currentIndex,
            onTap: (value){               
              bloc.changeNavbar(value);
              _currentIndex=value;
                      setState(() {
                        
                      });         
            }
            ,
            items:[
              BottomNavigationBarItem(icon: Icon(EvaIcons.imageOutline),title: Text("walls"),),
              BottomNavigationBarItem(icon: Icon(EvaIcons.layersOutline),title: Text("category"),),
              BottomNavigationBarItem(icon: Icon(EvaIcons.settings2Outline),title: Text("setting"),)
          ],
          // backgroundColor: Theme.of(context).backgroundColor,
           
          ),
        )
            )
          
    );
  }
    void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  
}