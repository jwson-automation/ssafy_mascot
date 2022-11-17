import 'package:flutter/material.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({super.key});

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                child: Center(child: Text("1번캐릭터")),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                child: Center(child: Text("2번캐릭터")),
              )
            ],
          )
        ],
      ),
    );
  }
}
