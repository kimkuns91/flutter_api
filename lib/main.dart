import 'package:flutter/material.dart';
import 'package:flutter_api/screens/home_screen.dart';

void main() => runApp(const MyApp());

// MyApp 클래스는 앱의 기본 구조를 정의합니다. StatelessWidget을 상속받습니다.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo', // 앱의 제목을 설정합니다.
      theme: ThemeData(
        primarySwatch: Colors.blue, // 앱의 기본 색상 테마를 설정합니다.
      ),
      home: const HomeScreen(), // 앱의 홈 화면으로 HomePage 위젯을 사용합니다.
    );
  }
}
