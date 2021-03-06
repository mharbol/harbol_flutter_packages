import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget{
  
  // title of the Comic as it appears
  final String title;

  // scr of the comic image... for these purposes in assets
  final String imgSrc;

  late final Key key;

ComicCard({required this.title, required this.imgSrc}){
  key = Key(title);
}

@override
Widget build(BuildContext context){
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textScaleFactor: 2,
        ),
        Image(image: AssetImage(imgSrc))
      ],
    )
  );
}

}