import 'dart:convert';

List<SampleRepoModel> loadFromJson(String str) => List<SampleRepoModel>.from(json.decode(str).map((x) => SampleRepoModel.fromJson(x)));
class SampleRepoModel {
  int userId;
  int id;
  String title;
  String body;

  SampleRepoModel({required this.userId, required this.id, required this.title, required this.body});

  factory SampleRepoModel.fromJson(Map<String, dynamic> json) =>
      SampleRepoModel(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);
}
