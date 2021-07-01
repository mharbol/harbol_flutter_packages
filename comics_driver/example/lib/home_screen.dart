
import 'package:comics_driver/comics_driver.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // simple scaffold with a Comic Card
    return Scaffold(

      backgroundColor: Colors.grey[300],

      // easy AppBar just to let you know what it is
      appBar: AppBar(
        title: Text('Daily Comics Demo'),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
        tooltip: 'Add Comic',
      ),

      // center the single ComicCard to demo what it looks like
      // in the future, ComicCard will be its own class that links
      // nicely with the ComicInfo class (TBP)
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Calvin and Hobbes',
              textScaleFactor: 2),

              // this will eventually have to become a FutureBuilder.... ahhhhh
              Image(
                image: NetworkImage('https://assets.amuniversal.com/8b61490094d601395dfb005056a9545d'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}