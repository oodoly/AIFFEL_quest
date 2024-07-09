import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(CatDogApp());
}

class CatDogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 앱이 처음 표시할 경로
      initialRoute: '/cat',

      // 동적 경로
      onGenerateRoute: (settings) { // 라우트 명명
      // 명명된 라우트가 정의되지 않은 경우 호출되는 {}
        if (settings.name == '/cat') {  // 라우트 이름이 '/three'인 경우
          return MaterialPageRoute(
            builder: (context) => CatScreen(),  // ThreeScreen 위젯을 반환합니다.
            settings: settings  // 라우트 설정을 전달합니다.
          );
        // case2
        } else if (settings.name == '/dog') {  // 라우트 이름이 '/four'인 경우
          return MaterialPageRoute(
            builder: (context) => DogScreen(),  // FourScreen 위젯을 반환합니다.
            settings: settings  // 라우트 설정을 전달합니다.
          );
        }
      },
    );
  }
}

class CatScreen extends StatefulWidget {
  @override
  _CatScreenState createState() => _CatScreenState();
}

class is_cat {
  bool is_or_not_cat = false;
}

class _CatScreenState extends State<CatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고양이'),
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
                      flex: 1,
                      child: Center(
                        child: ElevatedButton(
                          onPressed:() {
                            // 클릭 시 수행할 작업
                            print('is_cat : ${is_cat}');
                            Navigator.pushNamed(
                              context,
                              '/dog',
                              arguments: {"iscat" : false,});
                          },
                          child: Text('Next'),
                        ))),
                    Expanded(
                      flex: 1, // Expanded로 추가되는 부분들을 비율로 나누되, <Widget> 안의 모든 Expanded의 flex 값을 더한 것에 대한 비율로 처리된다.
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // 이미지 클릭 시 수행할 작업
                            print('is_cat : ${is_cat}');
                            Navigator.pushNamed(
                              context,
                              '/dog',
                              arguments: {"arg" : false,});
                          },
                          child: Image.network(
                            'https://images.ctfassets.net/nx3pzsky0bc9/2xOR5jtDFS9EzPw3WmmlHC/3113cc789ef08ef32ec754b55c47bede/Kitten_laying_in_pink_bed.jpeg',
                            height: 300, // 이미지 높이
                            width: 300,  // 이미지 너비
                          ),
                        ),
                      ),
                    ), // Expanded
                  ] // <Widget>[]
                ) // Column
              );

  }
}

class DogScreen extends StatefulWidget {
  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {

  // 인자 전달 받기
  Map<String, Object>? arg;

  //  = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null) {
      setState(() {
        arg = arguments as Map<String, Object>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('강아지'),
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
                      flex: 1,
                      child: Center(
                        child: ElevatedButton(
                          onPressed:() {
                            // 클릭 시 수행할 작업
                            print('is_cat : ${arg}');
                            Navigator.pop(
                              context,
                              );
                          },
                          child: Text('Back'),
                        ))),
                    Expanded(
                      flex: 1, // Expanded로 추가되는 부분들을 비율로 나누되, <Widget> 안의 모든 Expanded의 flex 값을 더한 것에 대한 비율로 처리된다.
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // 이미지 클릭 시 수행할 작업
                            print('is_cat : ${arg}');
                            Navigator.pop(
                              context,
                              );
                          },
                          child: Image.network(
                            'https://www.issuevalley.com/news/photo/202005/4962_3911_1353.jpg',
                            height: 300, // 이미지 높이
                            width: 300,  // 이미지 너비
                          ),
                        ),
                      ),
                    ), // Expanded
                  ] // <Widget>[]
                ) // Column
              );
  }
}