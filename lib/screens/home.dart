import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final namecontroller = TextEditingController();
  final whocontroller = TextEditingController();
  final agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text(
            "싸피 마스코트는 내가 뽑겠어",
            style: TextStyle(color: Colors.blue, fontSize: 50),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 400,
          child: TextField(
            controller: namecontroller,
            decoration: InputDecoration(
                hintText: "이름",
                hintStyle: TextStyle(color: Colors.blue),
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 400,
          child: TextField(
            controller: agecontroller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                hintText: "나이",
                hintStyle: TextStyle(color: Colors.blue),
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 400,
          child: TextField(
            controller: whocontroller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                hintText: "몇기냐?",
                hintStyle: TextStyle(color: Colors.blue),
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0))),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        ElevatedButton(
          child: Text("투표하기"),
          onPressed: () {
            print(namecontroller.text);
            print(agecontroller.text);

            final user = User(
                name: namecontroller.text,
                age: int.parse(agecontroller.text),
                who: int.parse(whocontroller.text));

            createUser(user);
            Navigator.pop(context);
          },
        )
      ]),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int age;
  final int who;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.who,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'who': who,
      };
}
