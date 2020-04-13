import 'package:flutter/material.dart';
import 'package:miluwallpaper/models/wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:miluwallpaper/widgets/imageview.dart';

class WallpaperList extends StatelessWidget {
  final List<Wallpaper> wallplist;

  const WallpaperList({Key key, this.wallplist}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: GridView.builder(
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, childAspectRatio: 0.7,mainAxisSpacing: 5.0),
    itemCount: wallplist.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context,index){
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgPath: wallplist[index].thumbnail,
                            title: wallplist[index].name,
                          )));
            },
            child: Hero(
              tag: wallplist[index].thumbnail,
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
                    imageUrl:wallplist[index].thumbnail
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
