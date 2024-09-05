class NewsModel {
  List<MainNews>? mainNews;

  NewsModel({this.mainNews});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['main_news'] != null) {
      mainNews = <MainNews>[];
      json['main_news'].forEach((v) {
        mainNews!.add(MainNews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mainNews != null) {
      data['main_news'] = mainNews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainNews {
  String? sub;
  String? img;
  String? title;

  MainNews({this.sub, this.img, this.title});

  MainNews.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    img = json['img'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub'] = sub;
    data['img'] = img;
    data['title'] = title;
    return data;
  }
}
