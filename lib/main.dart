import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'View/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Campus Finder',
      home: HomePage(),
    );
  }
}

class SendDataToFirebase extends StatefulWidget {
  const SendDataToFirebase({Key? key}) : super(key: key);

  @override
  _SendDataToFirebaseState createState() => _SendDataToFirebaseState();
}

class _SendDataToFirebaseState extends State<SendDataToFirebase> {
  final databaseRef = FirebaseDatabase.instance.ref('campus');
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["campuses"];
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJson(),
        builder: (_, __) {
          if (_items.isNotEmpty) {
            for (int index = 0; index < _items.length; index++) {
              databaseRef.child(index.toString()).set({
                "id": index,
                "name": _items[index]['name'],
                "status": _items[index]['status'],
                "admission": _items[index]['admission'],
                "fee": _items[index]['fee'],
                "city": _items[index]['city'],
                "adress": _items[index]['adress'],
                "phone": _items[index]['phone'],
                "Email": _items[index]['Email'],
                "Fax": _items[index]['Fax'],
                "URL": _items[index]['URL']
              });
            }
            return Center(
              child: Text("Done"),
            );
          } else {
            return Container();
          }
        });
  }}
