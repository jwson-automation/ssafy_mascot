import 'package:flutter/material.dart';
import 'package:ssafy_mascot/screens/home.dart';
import 'package:ssafy_mascot/screens/upload.dart';
import 'package:ssafy_mascot/screens/voting.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  // 변수 인덱스 값을 선언, List 위젯을 호출 하는 용도로 사용한다.
  // List[_selectedIndex] 와 같이 사용

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const UploadPage(),
    const VotingPage(),
    const Text("Profile"),
  ];

  // 바텀 네비게이션 바의 상태(state)를 바꾸기 위해서 변수를 선언해준다.
  // 총 4개의 버튼을 생성했기 때문에, 변수 타입은 List<Widget>

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("Tapped Index : " + _selectedIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("[비공식] 싸피 마스코트 투표")),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.blue.shade300,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: false,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "홈 화면으로 돌아가기"),
            BottomNavigationBarItem(
                icon: Icon(Icons.upload), label: "캐릭터 업로드하기"),
            BottomNavigationBarItem(
                icon: Icon(Icons.how_to_vote_outlined), label: "투표 하기"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "방명록 남기기")
          ]),
    );
  }
}
