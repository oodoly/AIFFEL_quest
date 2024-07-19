import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      home: Scaffold(
        body: ScreenSizeDetector(),
      ),
    );
  }
}

class ScreenSizeDetector extends StatefulWidget {
  @override
  _ScreenSizeDetectorState createState() => _ScreenSizeDetectorState();
}

class _ScreenSizeDetectorState extends State<ScreenSizeDetector> {
  late double screenWidth;
  late double screenHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 화면 크기를 얻어 초기 위치를 설정합니다.
    final screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width; // 화면 너비
    screenHeight = screenSize.height; // 화면 높이
  }

  @override
  Widget build(BuildContext context) {
    return HomePageWidget(screenWidth: screenWidth, screenHeight: screenHeight);
  }
}

class HomePageWidget extends StatefulWidget {
  final double screenWidth; // 화면 너비
  final double screenHeight; // 화면 높이

  HomePageWidget({required this.screenWidth, required this.screenHeight});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  double orbitRadius = 450; // 버튼 궤도의 반지름
  double buttonRadius = 50; // 각 버튼의 반지름
  double angle = 0.0; // 현재 회전 각도
  Offset lastPosition = Offset.zero; // 사용자가 마지막으로 터치한 위치

  // 초기 위치와 크기 변수
  late Offset textButton1Position; // 텍스트 버튼 1의 초기 위치
  late Offset textButton2Position; // 텍스트 버튼 2의 초기 위치
  double textButtonWidth = 200; // 텍스트 버튼의 너비
  double textButtonHeight = 100; // 텍스트 버튼의 높이

  @override
  void initState() {
    super.initState();
    // 초기 위치 설정
    textButton1Position = Offset(widget.screenWidth * 0.05, widget.screenHeight * 0.4); // 화면 왼쪽 중앙에 위치
    textButton2Position = Offset(widget.screenWidth * 0.05, widget.screenHeight * 0.4 + textButtonHeight + 20); // 텍스트 버튼 1 아래에 20 간격으로 위치
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = widget.screenWidth; // 화면 너비
    final distance = buttonRadius + 45.0; // 오른쪽 끝과의 거리 계산 (단일 버튼 반지름 + 15)
    final leftPosition = screenWidth - distance; // 궤도의 가장 오른쪽 점 기준으로 위치 설정

    // 버튼 각도 리스트 (190도에서 260도 사이의 각도)
    final angles = [
      190.0,  // 첫 번째 버튼 각도 (라디안으로 변환 필요)
      205.0,  // 두 번째 버튼 각도
      220.0,  // 세 번째 버튼 각도
      235.0,  // 네 번째 버튼 각도
      250.0,  // 다섯 번째 버튼 각도
      265.0,  // 여섯 번째 버튼 각도
      280.0,  // 일곱 번째 버튼 각도
    ].map((degree) => degree * pi / 180).toList(); // 각도를 라디안으로 변환

    return Stack(
      children: [
        // 텍스트 버튼 1
        _buildTextButton(
          textButton1Position,
          'Button 1',
          (newPosition) {
            setState(() {
              textButton1Position = newPosition; // 텍스트 버튼 1의 위치 업데이트
            });
          },
        ),
        // 텍스트 버튼 2
        _buildTextButton(
          textButton2Position,
          'Button 2',
          (newPosition) {
            setState(() {
              textButton2Position = newPosition; // 텍스트 버튼 2의 위치 업데이트
            });
          },
        ),
        // 회전하는 버튼들
        Positioned(
          left: leftPosition, // 계산된 위치를 기반으로 오른쪽 위치 설정
          top: (MediaQuery.of(context).size.height / 2) - orbitRadius, // 화면 중앙 수직 정렬
          child: GestureDetector(
            onPanStart: (details) {
              lastPosition = details.localPosition; // 드래그 시작 위치 저장
            },
            onPanUpdate: (details) {
              final center = Offset(orbitRadius, orbitRadius); // 궤도의 중심 계산
              final currentPosition = details.localPosition; // 현재 터치 위치
              final lastVector = lastPosition - center; // 이전 위치 벡터
              final currentVector = currentPosition - center; // 현재 위치 벡터
              // 각도 차이를 계산하여 업데이트
              final angleDelta = atan2(currentVector.dy, currentVector.dx) -
                  atan2(lastVector.dy, lastVector.dx);

              setState(() {
                angle += angleDelta; // 각도 업데이트
                lastPosition = currentPosition; // 현재 위치 저장
              });
            },
            child: Container(
              width: orbitRadius * 2, // 궤도의 너비
              height: orbitRadius * 2, // 궤도의 높이
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 7개의 버튼 생성
                  ...List.generate(7, (index) {
                    final buttonAngle = angles[index] + angle; // 버튼 각도 계산
                    final buttonX = orbitRadius * cos(buttonAngle); // 버튼의 x 좌표 계산
                    final buttonY = orbitRadius * sin(buttonAngle); // 버튼의 y 좌표 계산
                    print('Button ${index + 1} Position: ($buttonX, $buttonY)'); // 버튼 위치 프린트

                    return Transform(
                      transform: Matrix4.translationValues(
                        buttonX, // 버튼의 x 좌표
                        buttonY, // 버튼의 y 좌표
                        0,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _showCustomDialog(); // 커스텀 다이얼로그 표시
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), // 원형 버튼
                          padding: EdgeInsets.all(buttonRadius / 2), // 버튼 패딩 설정
                          textStyle: TextStyle(fontSize: 20), // 텍스트 스타일 설정
                          minimumSize: Size(buttonRadius * 2, buttonRadius * 2), // 버튼 크기 설정
                        ),
                        child: Text('${index + 1}'), // 버튼 텍스트
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        Stack(
        children: [
          Positioned(
            left: _xPosition,
            bottom: _yPosition,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _xPosition += details.delta.dx;
                  _yPosition -= details.delta.dy;
                });
              },
              child: Container(
                width: _buttonWidth,
                height: _buttonHeight,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Button',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      ],
    );
  }

  void _showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DraggableDialog(
          child: Container(
            width: 300,
            height: 400,
            color: Colors.white,
            child: Center(
              child: Text('This is a draggable dialog with a chart'),
            ),
          ),
        );
      },
    );
  }

  // 텍스트 버튼 생성 위젯
  Widget _buildTextButton(
    Offset position, // 버튼의 현재 위치
    String text, // 버튼에 표시될 텍스트
    void Function(Offset) onUpdate, // 위치 업데이트 콜백 함수
  ) {
    return Positioned(
      left: position.dx, // 텍스트 버튼의 x 좌표
      top: position.dy, // 텍스트 버튼의 y 좌표
      child: GestureDetector(
        onPanStart: (details) {
          setState(() {
            lastPosition = details.globalPosition; // 드래그 시작 위치 저장
          });
        },
        onPanUpdate: (details) {
          setState(() {
            final newPosition = Offset(
              position.dx + details.delta.dx, // 드래그된 x 좌표 업데이트
              position.dy + details.delta.dy, // 드래그된 y 좌표 업데이트
            );
            onUpdate(newPosition); // 새로운 위치 콜백 호출
          });
        },
        child: Container(
          width: textButtonWidth, // 텍스트 버튼 너비
          height: textButtonHeight, // 텍스트 버튼 높이
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // 테두리 색상
            borderRadius: BorderRadius.circular(12), // 모서리 둥글기
            color: Colors.transparent, // 배경 색상
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 40), // 텍스트 스타일
            ),
          ),
        ),
      ),
    );
  }
}

class DraggableDialog extends StatefulWidget {
  final Widget child;

  DraggableDialog({required this.child});

  @override
  _DraggableDialogState createState() => _DraggableDialogState();
}

class _DraggableDialogState extends State<DraggableDialog> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                offset += details.delta;
              });
            },
            child: Material(
              elevation: 8,
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}




  // double _xPosition = 10.0;
  // double _yPosition = 10.0;
  // double _buttonWidth = 60.0;
  // double _buttonHeight = 40.0;


