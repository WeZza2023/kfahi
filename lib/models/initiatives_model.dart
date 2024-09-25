class InitiativesModel {
  List<Initiatives>? initiatives;

  InitiativesModel({this.initiatives});

  InitiativesModel.fromJson(Map<String, dynamic> json) {
    if (json['initiatives'] != null) {
      initiatives = <Initiatives>[];
      json['initiatives'].forEach((v) {
        initiatives!.add(new Initiatives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.initiatives != null) {
      data['initiatives'] = this.initiatives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Initiatives {
  String? sub;
  String? task;
  String? vidId;
  String? title;

  Initiatives({this.sub, this.task, this.vidId, this.title});

  Initiatives.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    task = json['task'];
    vidId = json['vid_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['task'] = this.task;
    data['vid_id'] = this.vidId;
    data['title'] = this.title;
    return data;
  }
}
