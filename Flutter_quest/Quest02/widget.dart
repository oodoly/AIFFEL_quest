import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
                appBar: AppBar(
                  title: Text('플러터 앱 만들기'),
                  backgroundColor: Colors.blue,
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      print('메뉴를 누르셨습니다.'); // AppBar 배경색 변경
                      },
                    ),
                ),
                body: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1, // Expanded로 추가되는 부분들을 비율로 나누되, <Widget> 안의 모든 Expanded의 flex 값을 더한 것에 대한 비율로 처리된다.
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              print('버튼이 눌렸습니다.');
                            },
                            child: Text('Text')),]
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          child:
                            Stack( // 자동으로 왼쪽 상단으로 위치 지정
                              children: [
                                Container(
                                  width: 300,
                                  height: 300,
                                  color: Color.fromARGB(255, 32, 154, 255),
                                ),
                                Container(
                                  width: 240,
                                  height: 240,
                                  color: Color.fromARGB(255, 97, 180, 248),
                                ),
                                Container(
                                  width: 180,
                                  height: 180,
                                  color: Color.fromARGB(255, 135, 197, 249),
                                ),
                                Container(
                                  width: 120,
                                  height: 120,
                                  color: Color.fromARGB(255, 168, 213, 249),
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Color.fromARGB(255, 221, 238, 252),
                                ), // Container
                              ] 
                            ) // Stack
                        ) // Container
                      ) // Center
                    ), // Expanded
                  ] // <Widget>[]

                ), // Column
              ) // Scaffold
            ); // MaterialApp
  }
}


/*
회고:
* 박스 부분을 Align 으로 시도하다가 코드가 복잡해지는 걸 느꼈는데, Stack이라는 더 적합한 기능이 있었다. (퍼실님이 공유해주신 내용)
  무조건 아는 내용 안에서 응용하기보단, 이미 구현된 기능을 빠르게 파악하는 것도 필수적이라는 걸 또 절감했다.
* 투입된 시간이 예상보다 길었는데, 다음 두 요인으로 인해 길어졌다.
  1. 알고 있는 기능들 중 가장 적합한 걸 선별하는 과정이 있었다.
    - 예컨대 영역을 먼저 구분짓는 대신, 눈대중으로 영역을 구분해 화면상 text버튼과 사각형 스택의 위치를 조정할 수도 있었다.
    - 하지만 영역을 먼저 구분짓는 방식, 그 중에서도 화면을 flex를 사용해 비율로 구분짓는 방식이 이후 영역이 추가될 때에도 편집이 용이하겠다고 판단할 수 있었다.
  2. helper box에 가려서 지금 코딩중인 부분을 놓치곤 했다.
    - 이 부분은 구조에 익숙해지면 해결되려나? 의문이다.
* 팀메이트 원영님이 시간관리에 능숙하셨다. 덕분에 시간에 대한 조바심 낼 필요 없이 차분히 진행할 수 있었다.
  절반의 시간동안 먼저 각자 코딩을 시도해보고, 서로 도움 및 비평을 공유하는 시간 및 계속 코딩을 시도하는 시간을 나머지 절반동안 가졌다. 효율적이었다고 생각한다.
* 이제 시도해볼 것:
  - 메뉴바 구성하기
  - 더 다양한 영역 추가해보기
  - 다른 기능들 시도
  - ...
*/