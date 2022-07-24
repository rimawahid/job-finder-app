import 'dart:convert';

List<JobPost> postFromJson(String str) =>
    List<JobPost>.from(json.decode(str).map((x) => JobPost.fromMap(x)));

class JobPost {
  JobPost({required this.id, required this.category, required this.category_code, required this.code, required this.title, required this.description, required this.budget ,required this.budgetType, required this.jobLength});

  int id;
  String category;
  String category_code;
  String code;
  String title;
  String description;
  double budget;
  String budgetType;
  String jobLength;
  
  

  factory JobPost.fromMap(Map<String, dynamic> json) => JobPost(
        id: json["id"],
        category: json["category"],
        category_code: json["category_code"],
        code: json["code"],
        title: json["title"],
        description: json["description"],
        budget: json["budget"],
        budgetType: json["budgetType"],
        jobLength: json["jobLength"],
        
      );
}
