import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(searchController: _searchController),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final TextEditingController searchController;

  const MyHomePage({required this.searchController});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MILESTONE beta",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 검색 버튼을 누르면 검색 기능을 추가할 수 있습니다.
              // 여기에 검색 기능을 구현하세요.
              // 예를 들면 showDialog 등을 사용하여 검색창을 띄울 수 있습니다.
              // widget.searchController.text 에 검색어가 들어있을 것입니다.
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeScreen(),
          PublicTransportScreen(),
          NavigationScreen(),
          NearbyScreen(),
          BookmarksScreen(),
          MyLogScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "대중교통",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "내비게이션",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "주변",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "즐겨찾기",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_time_outlined),
            label: "마이로그",
          ),
        ],
        selectedItemColor: Colors.greenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("내 위치"),
                  content: Text("현재 위치"),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("닫기"),
                    )
                  ],
                );
              }
          );
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // 검색 결과를 보여주는 화면을 구현하세요.
    return Center(
      child: Text('검색 결과 화면'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // 검색어 입력 중에 보여줄 예상 검색어 목록을 구현하세요.
    return Center(
      child: Text('예상 검색어 목록'),
    );
  }
}

// 홈 화면
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈 화면"),
      ),
      body: Center(
        child: Text("지도"),
      ),
    );
  }
}

class PublicTransportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("대중교통 화면"),
      ),
      body: Center(
        child: Text("대중교통 리스트"),
      ),
    );
  }
}

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내비게이션 화면"),
      ),
      body: Center(
        child: Text("내비게이션 지도"),
      ),
    );
  }
}

class NearbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("주변 화면"),
      ),
      body: Center(
        child: Text("주변에 뭐 있나"),
      ),
    );
  }
}

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("즐겨찾기 화면"),
      ),
      body: Center(
        child: Text("즐겨찾기 리스트"),
      ),
    );
  }
}

class MyLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이로그 화면"),
      ),
      body: Center(
        child: Text("마이로그 이것저것"),
      ),
    );
  }
}
