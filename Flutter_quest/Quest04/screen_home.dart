import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            color: Colors.green,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('광고'),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // 버튼 클릭 시 동작
                              print('Button $index clicked');
                            },
                            child: Container(
                              width: 150,
                              color: Colors.blue[(index % 9 + 1) * 100],
                              child: Center(
                                child: Text('Button $index'),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('더 보기...'),
                  ),
                  Container(
                    height: 400,
                    color: Colors.yellow,
                    child: Center(
                      child: Text('세로 스크롤'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text('세 번째 페이지'),
            ),
          ),
        ],
      ),
    );
  }
}
