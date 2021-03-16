import 'package:flutter/material.dart';
import 'package:key_pagestorage_example/main.dart';

class GridViewPageStorageKeyPage extends StatefulWidget {
  @override
  _GridViewPageStorageKeyPageState createState() =>
      _GridViewPageStorageKeyPageState();
}

class _GridViewPageStorageKeyPageState
    extends State<GridViewPageStorageKeyPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GridViewPageStorageKeyPage(),
              )),
            ),
          ],
        ),
        body: buildPages(),
        bottomNavigationBar: buildBottomBar(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.clear),
          title: Text('GridView', style: style),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          title: Text('Key GridView', style: style),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return buildPageOne();
      case 1:
        return buildPageTwo();
      default:
        return Container();
    }
  }

  Widget buildPageOne() => GridView.builder(
        itemCount: 40,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => GridTile(
          child: Center(
            child: Text(
              'Grid item ${index + 1}',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );

  Widget buildPageTwo() => GridView.builder(
        key: PageStorageKey<String>('pageTwo'),
        itemCount: 40,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => GridTile(
          child: Center(
            child: Text(
              'Grid item ${index + 1}',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
}
