import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 해당 기기의 width를 가져옴
    // size이외에도 padding등 여러가지를 가져올 수 있음
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min, // 최대한 뭉치게해서 둠
      crossAxisAlignment: CrossAxisAlignment.center, // Row의 main방향과 반대
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image.asset(
            'assets/images/12.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Image.asset('assets/images/231.jpg'),
        ),
        Expanded(
          child: Image.asset('assets/images/dami5.jpg'),
        ),
      ],
    );
  }
}
