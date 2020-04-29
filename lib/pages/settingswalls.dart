import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:miluwallpaper/bloc/bloc.dart';
import 'package:miluwallpaper/services/api.dart';
import 'package:miluwallpaper/utils/themes.dart';
import 'package:provider/provider.dart';
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
    final streambloC=Provider.of<BloC>(context); 
    print(streambloC.isdart);
    return StreamBuilder(
            stream: streambloC.streamTheme,           
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
          scrollDirection: Axis.vertical,
          child:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:Column(
                 //crossAxisAlignment: CrossAxisAlignment.ce,
                 mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: streambloC.isdart==true?Colors.white:Colors.blueAccent.withOpacity(0.2),
                  child: Image.asset('assets/images/ic_launcher.png',height: 70)
                ),
                SizedBox(
                  height: 20,
                ), 
                  Text("Miluwalls 2.0",style: TextStyle(color:streambloC.isdart==true?Colors.white:Colors.black,)),
                SizedBox(
                  height: 20,
                ),        
                Row(
                 children: <Widget>[
                   Icon(EvaIcons.moonOutline,color: streambloC.isdart==true?Colors.white:Colors.black,),
                   Expanded(
                       child: SwitchListTile(
                      title: Text("Dark Mode",style: TextStyle(color:streambloC.isdart==true?Colors.white:Colors.black,)),
                      value: streambloC.isdart,
                      onChanged: (value){
                      streambloC.changeTheme();        //print(streambloC.isdart);
                         },
                           ),
                   ),
                 ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                 children: <Widget>[
                   Icon(EvaIcons.bellOutline,color: streambloC.isdart==true?Colors.white:Colors.black,),
                   Expanded(
                       child: SwitchListTile(
                      title: Text("Notification",style: TextStyle(color:streambloC.isdart==true?Colors.white:Colors.black,)),
                      value: streambloC.isdart,
                      onChanged: (value){
                      streambloC.changeTheme();        //print(streambloC.isdart);
                         },
                  ),
                   ),
                 ],
                ),
                ListTile(
                  title: Text("Dowloand location",style: TextStyle(color:streambloC.isdart==true?Colors.white:Colors.black,)),
                  subtitle: Text("/Storade/emulated/0/miluwalls"),
                )
              ],)
          )
        )
      ),
     )
    );
  }
}