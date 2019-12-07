import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  String imageUrlByKey(int key) {
    return "https://picsum.photos/id/$key/300/300";
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 50,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return ImageDetailHome(imageUrlByKey(index));
            }));
          },
          child: Hero(
            tag: imageUrlByKey(index),
            child: Image.network(imageUrlByKey(index)),
          ),
        );
      },
    );
  }
}

class ImageDetailHome extends StatelessWidget {
  final String imageUrl;

  ImageDetailHome(this.imageUrl); // 생성자를 통해 imageUrl 을 전달받음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(180.0),
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}
