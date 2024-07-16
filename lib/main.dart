import 'package:flutter/material.dart';

// CLASS

// ROOT
void main() {
  runApp(const App());
}

//  * APP
//  * StatelessWidget은 stl을 입력하면 자동으로 전체 구조를 입력할 수 있습니다.
//  * 모든 것은 위젯이다. 블록처럼 위젯에 위젯을 쌓아가며 앱을 만드는 것.
//  * 위젯은 외우지 말고 찾아보며 사용하자. -> https://docs.flutter.dev/development/ui/widgets
//  * 모든 위젯은 build 메서드를 사용해야한다.(build 또한 자동 완성 가능)
//  * 모든 앱은 CupertinoApp 혹은 MaterialApp 중에 선택해야 하는데, materialapp이 훨씬 보기 좋으니 MaterialApp을 쓰자.
//  * 모든 화면은 Scaffold(구조)를 가져야 한다.
//  * ANDROID : MaterialApp and IOS : CupertinoApp
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Hey, Selena",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
