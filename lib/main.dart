import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Image Test",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Asset"),
        ),
        // SafeArea는 사용자가 input을 할때 키보드가 위로올라오면 화면이
        // 뭉개지지않고 잘 보여지도록 도와주는 위젯
        body: SafeArea(
          child: Test(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
            color: Colors.yellow,
            child: Container(
              height: 50.0,
            )),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 복잡한 스크롤 기능을 넣고싶을때 사용
    return CustomScrollView(
      cacheExtent: 1,
      // sliver안에는 sliver관련 widget만 올수 있음
      slivers: <Widget>[
        // dynamic한 AppBar를 만들도록 해줌
        SliverAppBar(
          elevation: 40.0,
          pinned: true, // 고정시킬지 말지
          snap: false,
          floating: false, // true로 설정하면 스크롤 내릴때 바로 앱바가 나타남
          backgroundColor: Colors.white,
          expandedHeight: 250.0,
          title: Text(
            "Demo",
            style: TextStyle(color: Colors.black),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
            // collapseMode는 스크롤을 위로했을때 해당부분이 어떻게 사라질지를 결정
            //  none을 하면 FlexibleSpaceBar영역은 가만히있고 스크롤이 올라가면서 사라짐
            // pin은 같이올라가고 parallax는 천천히 같이올라가면서 사라짐
            collapseMode: CollapseMode.parallax,
            background: Image.asset(
              "assets/images/12.jpg",
              fit: BoxFit.cover, // fill은 부족한 부분을 늘려서 채움(가로가부족하면 가로를늘림)
              // cover를 화면전체에 알맞게 꽉찰때까지 사진을 전체적으로 늘림
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 100,
              child: Text("sliver list 1"),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(color: Colors.pink[100]),
            ),
            Container(
              height: 100,
              child: Text("sliver list 2"),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(color: Colors.pink[100]),
            ),
            Container(
              height: 100,
              child: Text("sliver list 3"),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(color: Colors.pink[100]),
            ),
            Container(
              height: 100,
              child: Text("sliver list 4"),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(color: Colors.pink[100]),
            ),
            Container(
              height: 100,
              child: Text("sliver list 5"),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(color: Colors.pink[100]),
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0, //하나의 그리드가 가지는 가로최대길이(200이면 2개를가지네..)
            mainAxisSpacing: 10.0, // 한행들이 떨어져있는거리(각 로우들의 세로마진?)
            crossAxisSpacing: 10.0, // 한개의 그리드들이 떨어져 있는거리
            childAspectRatio: 4.0, // 해당값에따라 항목의 크기를 결정(분수?)
          ),

          // SliverChildListDelegate는 화면상에 보이건안보이건 전부 로딩시킴
          // 즉 lazy loading이 안되기때문에 화면에 안보일정도로 많다면
          // SliverChildBuilderDelegate를 사용하는게 더 좋음
          // 화면이 Container를 display하기 시작하면 작동함.
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            // 해당 property가 없으면 무한대로 생성
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 60.0,
          // SliverChildBuilderDelegate위와 마찬가지. lazy loading를 사용
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
            childCount: 40,
          ),
        ),
      ],
    );
  }
}
