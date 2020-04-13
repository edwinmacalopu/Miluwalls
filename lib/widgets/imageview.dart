import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imgPath;
  final String title;

  const ImageView({Key key,@required this.imgPath,@required this.title}) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
           Hero(
          tag: imgPath,
           child:Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
                      child: CachedNetworkImage(
               imageUrl: imgPath,
                placeholder: (context, url)
                 => Container(
                color: Color(0xfff5f8fd),
                  ),
                fit: BoxFit.cover),
           )),
           Positioned(
              bottom: 20,
              child:FloatingActionButton.extended(
                onPressed: (){},
                 icon: Icon(EvaIcons.download),
                 backgroundColor: Theme.of(context).primaryColor,
                 label: Text('DOWLOAND'))
             
           )  ,
           Positioned.fill(
              top: 50,
              left: 20,
             child: Align(
               alignment: Alignment.topLeft,
               child: Row(
                 children: <Widget>[
                   GestureDetector(
                     onTap: ()
                     {
                       Navigator.pop(context);
                     },
                     child: Icon(EvaIcons.arrowBack,color: Colors.white,)),
                   SizedBox(
                     width: 20,
                   ),
                   Text(title,style: TextStyle(color:Colors.white),)
                 ],
               )
             ) 
           )
        ],
          
      ));

         
  }
}