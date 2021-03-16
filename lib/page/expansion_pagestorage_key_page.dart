import 'package:flutter/material.dart';
import 'package:key_pagestorage_example/main.dart';
import 'package:key_pagestorage_example/widget/basic_tile_widget.dart';

class ExpansionPageStorageKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(MyApp.title),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildPageOne(),
              buildPageTwo(),
            ],
          ),
        ),
      );

  Widget buildPageOne() => ListView(
        children:
            basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
      );

  Widget buildPageTwo() => ListView(
        key: PageStorageKey<String>('pageTwo'),
        children:
            basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
      );
}
