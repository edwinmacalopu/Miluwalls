import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:miluwallpaper/pages/categorytype.dart';
class Category extends StatelessWidget {
  final List<Collection> category;
  final bool theme;

  const Category({Key key, this.category, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, childAspectRatio: 1.0,mainAxisSpacing: 5.0),
    itemCount: category.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context,index){

        return Stack(
                  children:<Widget>[                     
            Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8.0),
                ),
                child: GestureDetector(
               onTap: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => CategoryType(
                tipocateg: category[index].name,theme: theme,
               )));
               },
               child: SizedBox(
                 width: double.infinity,
                 height: 300,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(8.0),
                   child: CachedNetworkImage(
                   errorWidget: (context, url, error) => Container(
                     width: double.infinity,
                     height: double.infinity,
                     child: Center(
                       child: Icon(
                         Icons.error,
                         color: Colors.white,
                       ),
                     ),
                   ),
                   fit: BoxFit.cover,
                   placeholder: (context, url) => Center(
                     child: Container(
                         width: double.infinity,
                         height: double.infinity,
                         color: Colors.white,
                         child: Center(
               child: CircularProgressIndicator(
             valueColor: AlwaysStoppedAnimation(
                 Colors.white),
                         ))),
                   ),
                   imageUrl:(category[index].previewUrl
                     ),
                 ),
               ),
                ),
          )
          ),
          Center(child: Text(category[index].name,style: Theme.of(context).textTheme.display1,))
        ]);
      },
    );
  }
}
 