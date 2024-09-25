class NotificationsModel {
  List<MainNotifications>? mainNotifications;

  NotificationsModel({this.mainNotifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    if (json['main_notifications'] != null) {
      mainNotifications = <MainNotifications>[];
      json['main_notifications'].forEach((v) {
        mainNotifications!.add(new MainNotifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainNotifications != null) {
      data['main_notifications'] =
          this.mainNotifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainNotifications {
  String? sub;
  String? link;
  String? title;

  MainNotifications({this.sub, this.link, this.title});

  MainNotifications.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['link'] = this.link;
    data['title'] = this.title;
    return data;
  }
}
