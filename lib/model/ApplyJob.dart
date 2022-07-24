import 'dart:convert';

List<ApplyJob> postFromJson(String str) =>
    List<ApplyJob>.from(json.decode(str).map((x) => ApplyJob.fromMap(x)));

class ApplyJob {
  ApplyJob({required this.id, required this.name, required this.email, required this.phone, required this.cv});

  int id;
  String name;
  String email;
  String phone;
  String cv;

  
  

  factory ApplyJob.fromMap(Map<String, dynamic> json) => ApplyJob(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        cv: json["cv"],
      );
}
