import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/provider.dart';
import 'package:miluwallpaper/services/api.dart';
import 'package:miluwallpaper/utils/themes.dart';
class Settingswalls extends StatefulWidget {
     final bool theme;

  const Settingswalls({Key key, this.theme}) : super(key: key);

  @override
  _SettingswallsState createState() => _SettingswallsState();
}

class _SettingswallsState extends State<Settingswalls> {

   final apis=Apiwalls();
  @override
  Widget build(BuildContext context) {
    final streambloC=Provider.of(context);
    print(streambloC.isdart);
    return StreamBuilder(
            stream: streambloC.streamTheme,
            initialData: false,
              builder: (context, snapshot) => Theme(
              data: snapshot.hasData && snapshot.data
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
                    
          child: Scaffold(
        appBar: AppBar(
        
          elevation: 0,
          title:Text("Ajustes")
          
        ),
        body:SingleChildScrollView(
          child:Container(
            margin: EdgeInsets.only(top: 30),
            child:Column(

              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Theme.of(context).accentColor.withOpacity(0.5),
                  child: Image.asset('assets/images/ic_launcher.png',height: 70)
                ),
                SizedBox(
                  height: 20,
                ),  
                  SwitchListTile(
                    title: Text("Dark Mode",style: Theme.of(context).textTheme.title,),
                    value: streambloC.isdart,
                   onChanged: (value){
                          streambloC.changeTheme();
                          print(streambloC.isdart);
                   },
                  // activeColor: ThemeData(),
                   ),
                   Text('HOLA MUNDO')
                  
                  
              ],)
          )
        )
      ),
    
              )
    );
    
  }
}