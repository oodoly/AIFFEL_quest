import 'package:flutter/material.dart';
import 'screen_home.dart';
import 'screen_explore.dart';
import 'screen_shopping.dart';
import 'screen_lifestyle.dart';
import 'screen_mypage.dart';
import 'class_user_posting.dart';
import 'class_company_info.dart';
// import 'custom_app_bar.dart';

void main() {
  runApp(TrialApp());
}

class TrialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitScreen(),
    );
  }
}

// class InitScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  PreferredSizeWidget _getAppBar() {
    switch (_selectedIndex) {
      // case 0:
      //   return NotHomeAppBar(title: 'Explore');
      // case 1:
      //   return NotHomeAppBar(title: 'Explore');
      // case 2:
      //   return NotHomeAppBar(title: 'Shop');
      // case 3:
      //   return MyPageAppBar(title: 'MyPage');
      // default:
      //   return HomeAppBar(title: 'Home');
      case 0:
        return HomeAppBar();
      case 1:
        return NotHomeAppBar();
      case 2:
        return NotHomeAppBar();
      case 3:
        return NotHomeAppBar();
      case 4:
        return MyPageAppBar();
      default:
        return AppBar(title: Text('Default AppBar'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _selectedIndex == 0 
      //   ? HomeAppBar(title: 'Home Screen')
      //   : NotHomeAppBar(title: 'ExploreScreen'),
      appBar: _getAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(),
          ExploreScreen(),
          ShopScreen(),
          LifestyleScreen(),
          MyPage(),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.amber[800] : Color.fromARGB(255, 62, 62, 62)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: _selectedIndex == 1 ? Colors.amber[800] : Color.fromARGB(255, 62, 62, 62)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: _selectedIndex == 2 ? Colors.amber[800] : Color.fromARGB(255, 62, 62, 62)),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style, color: _selectedIndex == 3 ? Colors.amber[800] : Color.fromARGB(255, 62, 62, 62)),
            label: 'Lifestyle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _selectedIndex == 4 ? Colors.amber[800] : Color.fromARGB(255, 62, 62, 62)),
            label: 'My Page',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}




// AppBar 커스터마이징하기
// screen_home appBar
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final List<Widget> actions;

  HomeAppBar({
    this.backgroundColor = Colors.white,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: SearchBar(),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.favorite, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// screen_not_home appBar
class NotHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final List<Widget> actions;

  NotHomeAppBar({
    this.backgroundColor = Colors.white,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// MyPage appBar
class MyPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final List<Widget> actions;

  MyPageAppBar({
    this.backgroundColor = Colors.white,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}





