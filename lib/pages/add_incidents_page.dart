import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

enum PhotoOptions { camera, library }

class AddIncidentsPage extends StatefulWidget {
  @override
  _AddIncidentsPage createState() => _AddIncidentsPage();
}

class _AddIncidentsPage extends State<AddIncidentsPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cvController = TextEditingController();

  void _saveIncident(BuildContext context) async {
    print(_nameController.text);
    print(_emailController.text);
    print(_phoneController.text);
     print(_cvController.text);
    final response = await http.post(
      Uri.parse('http://192.168.100.203:8080/_apply/save'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'cv': _cvController.text
      }),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Apply Job"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: _nameController,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return "Name is required!";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(hintText: "Enter name"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return "quantity is required!";
                    //   }
                    //   return null;
                    // },
                    maxLines: null,
                    decoration: InputDecoration(hintText: "Enter email"),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return "quantity is required!";
                    //   }
                    //   return null;
                    // },
                    maxLines: null,
                    decoration: InputDecoration(hintText: "Enter phone"),
                  ),
                  TextFormField(
                    controller: _cvController,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return "quantity is required!";
                    //   }
                    //   return null;
                    // },
                    maxLines: null,
                    decoration: InputDecoration(hintText: "Enter cv"),
                  ),
                  
                  FlatButton(
                    child: Text("Save"),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _saveIncident(context);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
