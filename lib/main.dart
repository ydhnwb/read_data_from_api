import 'package:flutter/material.dart';
import 'dart:convert';
import 'ApiHelper.dart';
import 'UserModel.dart';




void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Read data from API",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.blueAccent,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  
  List<UserModel> userList = new List<UserModel>();

  void _ambilSemuaUser(){
    ApiHelper.getAllUsers().then((response){
      setState(() {
        Iterable mList = json.decode(response.body);
        userList = mList.map((f) =>
          UserModel.fromjson(f)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _ambilSemuaUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read from API"),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, position){
          return ListTile(
            onTap: () => Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("You clicked " + userList[position].id.toString()))),
            title: Text(userList[position].name),
            subtitle: Text(userList[position].email),
          );
            
        }
      ),
    );
  }
}

