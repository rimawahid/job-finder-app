import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/jobPost.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPage createState() => _IncidentListPage();
}

// void _deleteIncident(BuildContext context, String id) async {
//   final response = await http.delete(
//     Uri.parse('http://192.168.100.203:8080/_product/delete/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//   fetchPost();
// }

// void _editIncident(BuildContext context, String id) async {
//   final response = await http.get(
//     Uri.parse('http://192.168.100.203:8080/_product/edit/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );

//   Navigator.pop(context, true);
//   fetchPost();
// }

Future<List<JobPost>> fetchPost() async {
  final response =
      await http.get(Uri.parse('http://192.168.100.203:8080/_jobpost/showJobs'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<JobPost>((json) => JobPost.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load product');
  }
}

class _IncidentListPage extends State<IncidentListPage> {
  late Future<List<JobPost>> futurePost;

  @override
  void initState() {
    super.initState();
    fetchPost();
    futurePost = fetchPost();
  }

  // void _navigateToAddIncidentsPage(BuildContext context) async {
  //   bool incidentAdded = await AppNavigator.navigateToAddIncidentsPage(context);
  //   fetchPost();
  // }

  // void _navigateToShowIncidentsPage(BuildContext context) async {
  //   bool incidentAdded =
  //       await AppNavigator.navigateToShowIncidentsPage(context);
  //   fetchPost();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("List of Products")),
        // drawer: Drawer(
        //     child: ListView(
        //   children: [
        //     ListTile(
        //       title: Text("Add Product"),
        //       onTap: () {
        //         _navigateToAddIncidentsPage(context);
        //       },
        //     ),
        //     ListTile(
        //       title: Text("Show Products"),
        //       onTap: () {
        //         _navigateToShowIncidentsPage(context);
        //       },
        //     )
        //   ],
        // )),
        body: FutureBuilder<List<JobPost>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97FFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].title}" +
                              " ${snapshot.data![index].category}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data![index].budget}"),
                        // FlatButton(
                        //   child: Text("Edit"),
                        //   onPressed: () {
                        //     FocusScope.of(context).requestFocus(FocusNode());
                        //     //_editIncident(
                        //     //   context, "${snapshot.data[index].id}");

                        //     Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => EditDataWidget(
                        //         snapshot.data[index],
                        //       ),
                        //     ));
                        //   },
                        //   color: Colors.blue,
                        //   textColor: Colors.white,
                        // ),
                        // FlatButton(
                        //   child: Text("Delete"),
                        //   onPressed: () {
                        //     _deleteIncident(
                        //         context, "${snapshot.data[index].id}");
                        //   },
                        //   color: Colors.blue,
                        //   textColor: Colors.white,
                        // )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
