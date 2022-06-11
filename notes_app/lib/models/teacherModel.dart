class TeacherModel {
  String? name;
  String? subjectName;

  TeacherModel({this.name, this.subjectName});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subjectName = json['subjectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subjectName'] = this.subjectName;
    return data;
  }
}
