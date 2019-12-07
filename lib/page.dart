import 'package:flutter/material.dart';

// PageView는 스크롤하면 화면이 옆으로/위아래로 넘어감
class Test extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final PageView pageView = PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.black38),
          child: Text("page1"),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.yellow),
          child: Text("page2"),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.pink),
          child: Text("page3"),
        ),
      ],
    );

    return Container(child: pageView);
  }
}
