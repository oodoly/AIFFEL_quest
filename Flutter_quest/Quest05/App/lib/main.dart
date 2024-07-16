import 'package:flutter/material.dart';

void main() {
  runApp(JellyfishClassifier());
}

class JellyfishClassifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _imagePath = 'assets/image/jellyfish.jpg'; // 예시 이미지

  void _onLeftButtonPressed() {
    // 이미지를 불러와서 인퍼런스하고 출력값을 콘솔에 출력하는 코드 추가
    print('예측 결과 : ... 클래스'); // print('예측 결과 : ${} 클래스');
  }

  void _onRightButtonPressed() {
    print('... 확률로 예측했습니다.'); // print('${} 확률로 예측했습니다.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.animation_outlined),
        title: Text('Jellyfish Classifier'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Image.asset(_imagePath, fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: _onLeftButtonPressed,
                    icon: Icon(Icons.play_arrow),
                    label: Text(''), // 인퍼런스
                  ),
                  ElevatedButton.icon(
                    onPressed: _onRightButtonPressed,
                    icon: Icon(Icons.play_arrow),
                    label: Text(''),
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
