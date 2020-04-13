// To parse this JSON data, do
//
//     final wallpapersmodels = wallpapersmodelsFromJson(jsonString);

import 'dart:convert';

Wallpapersmodels wallpapersmodelsFromJson(String str) => Wallpapersmodels.fromJson(json.decode(str));

String wallpapersmodelsToJson(Wallpapersmodels data) => json.encode(data.toJson());

class Wallpapersmodels {
    List<Collection> collections;
    List<Wallpaper> wallpapers;

    Wallpapersmodels({
        this.collections,
        this.wallpapers,
    });

    factory Wallpapersmodels.fromJson(Map<String, dynamic> json) => Wallpapersmodels(
        collections: List<Collection>.from(json["Collections"].map((x) => Collection.fromJson(x))),
        wallpapers: List<Wallpaper>.from(json["Wallpapers"].map((x) => Wallpaper.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Collections": List<dynamic>.from(collections.map((x) => x.toJson())),
        "Wallpapers": List<dynamic>.from(wallpapers.map((x) => x.toJson())),
    };
}

class Collection {
    String name;
    String previewUrl;
    String previewThumbnailUrl;

    Collection({
        this.name,
        this.previewUrl,
        this.previewThumbnailUrl,
    });

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        name: json["name"],
        previewUrl: json["preview_url"],
        previewThumbnailUrl: json["preview_thumbnail_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "preview_url": previewUrl,
        "preview_thumbnail_url": previewThumbnailUrl,
    };
}

class Wallpaper {
    String name;
    Author author;
    String url;
    String thumbnail;
    Dimensions dimensions;
    Copyright copyright;
    String collections;

    Wallpaper({
        this.name,
        this.author,
        this.url,
        this.thumbnail,
        this.dimensions,
        this.copyright,
        this.collections,
    });

    factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
        name: json["name"],
        author: authorValues.map[json["author"]],
        url: json["url"],
        thumbnail: json["thumbnail"],
        dimensions: dimensionsValues.map[json["dimensions"]],
        copyright: copyrightValues.map[json["copyright"]],
        collections: json["collections"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "author": authorValues.reverse[author],
        "url": url,
        "thumbnail": thumbnail,
        "dimensions": dimensionsValues.reverse[dimensions],
        "copyright": copyrightValues.reverse[copyright],
        "collections": collections,
    };
}

enum Author { MILUWALLS, MATHY_ECKERDT, GOOGLE, IMRAAN_VIRANI, UNSPLASH }

final authorValues = EnumValues({
    "google+": Author.GOOGLE,
    "Imraan Virani": Author.IMRAAN_VIRANI,
    "Mathy Eckerdt": Author.MATHY_ECKERDT,
    "miluwalls": Author.MILUWALLS,
    "unsplash": Author.UNSPLASH
});

 

enum Copyright { FREE_DO_WHATEVER_YOU_WANT, FREE_DO_WHAKTEVER_YOU_WANT }

final copyrightValues = EnumValues({
    "Free (do whaktever you want)": Copyright.FREE_DO_WHAKTEVER_YOU_WANT,
    "Free (do whatever you want)": Copyright.FREE_DO_WHATEVER_YOU_WANT
});

enum Dimensions { THE_1440_X_2560, THE_1242_X_2208, THE_2252_X_4002, THE_1500_X_2800, THE_4688_X_10150, THE_2500_X_3840, THE_3000_X_5333, THE_1868_X_3840 }

final dimensionsValues = EnumValues({
    "1242 x 2208": Dimensions.THE_1242_X_2208,
    "1440 x 2560": Dimensions.THE_1440_X_2560,
    "1500 x 2800": Dimensions.THE_1500_X_2800,
    "1868 x 3840": Dimensions.THE_1868_X_3840,
    "2252 x 4002": Dimensions.THE_2252_X_4002,
    "2500 x 3840": Dimensions.THE_2500_X_3840,
    "3000 x 5333": Dimensions.THE_3000_X_5333,
    "4688 x 10150": Dimensions.THE_4688_X_10150
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
