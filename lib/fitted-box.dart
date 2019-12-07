import 'package:flutter/material.dart';

// FittedBox는 자식이 부모영역을 넘어서서 표현될때, 부모안으로 넣고싶은 자식을
// FittedBox로 감싸주면 컨트롤 할수있음
// AbsorbPointer는 터치이벤트를 못하게 막아주는 Wrapper
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.pink[200],
          height: 700,
          width: size.width,
        ),
        Container(
          color: Colors.yellow[100],
          height: 500,
          width: 200,
          // FittedBox를 사용하지않으면 이미지가 width,height크기만큼 안 맞춰지고 초과함
          // FittedBox로 부모크기에 맞춰줌
          child: FittedBox(
            // alignment: Alignment.bottomRight,
            // fit: BoxFit.fitWidth,
            child: Image.asset("assets/images/231.jpg"),
          ),
        ),
        // FittedBox(
        //   // alignment: Alignment.bottomRight,
        //   // fit: BoxFit.fitWidth,
        //   child: Image.asset("assets/images/231.jpg"),
        // ),
      ],
    );
  }
}
