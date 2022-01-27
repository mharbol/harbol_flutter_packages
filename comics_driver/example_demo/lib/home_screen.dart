import 'package:comics_driver/comic_card.dart';
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
        onPressed: () => _toastNewComic(context),
        child: Icon(Icons.add),
        tooltip: 'Add Comic',
      ),

      // center the single ComicCard to demo what it looks like
      // in the future, ComicCard will be its own class that links
      // nicely with the ComicInfo class (TBP)
      body: ComicList(),
    );
  }

  // toasts a message that says that this is where new comics will be added
  void _toastNewComic(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("This is where we would add a \"New Comic\" page."),
    ));
  }
}


/*


Reorderable list stuff






*/


// pretty much just copying what the tutorial had
class ComicList extends StatefulWidget {

  const ComicList({ Key? key }) : super(key: key);

  @override
  _ComicListState createState() => _ComicListState();
}

class _ComicListState extends State<ComicList> {

  final List<ComicCard> _items = [
    ComicCard(title: 'Calvin and Hobbes', imgSrc: 'assets/cal_and_hob.gif'),
    ComicCard(title: 'Frazz', imgSrc: 'assets/frazz.gif'),
    ComicCard(title: 'Pearls Before Swine', imgSrc: 'assets/pearls.gif'),
    ComicCard(title: 'Andy Capp', imgSrc: 'assets/andy_capp.gif'),
    ComicCard(title: 'Peanuts', imgSrc: 'assets/peanuts.gif'),
    ComicCard(title: 'B.C.', imgSrc: 'assets/bc.gif'),
    ComicCard(title: 'Dilbert', imgSrc: 'assets/dilbert.gif'),
    ComicCard(title: 'Foxtrot', imgSrc: 'assets/foxtrot.gif'),
    ComicCard(title: 'Crabgrass', imgSrc: 'assets/crabgrass.gif'),
    ComicCard(title: 'Wizard of Id', imgSrc: 'assets/wizard.gif'),
    
  ];

  // called by ReorderableList after list child dropped into pos
  void _onReorder(int oldIndex, int newIndex){
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = _items.removeAt(oldIndex);
      _items.insert(newIdx, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReorderableListView(
        onReorder: _onReorder,
        children: _items,
      ),
    );
  }
}