import 'package:flutter/material.dart';
import 'package:key_pagestorage_example/main.dart';

final bucketGlobal = PageStorageBucket();

class PersistPageStoragePage extends StatefulWidget {
  @override
  _PersistPageStoragePageState createState() => _PersistPageStoragePageState();
}

class _PersistPageStoragePageState extends State<PersistPageStoragePage> {
  int index = 0;

  @override
  void initState() {
    super.initState();

    final state =
        PageStorage.of(context)!.readState(context, identifier: 'pageOne');
    print(state);
  }

  @override
  Widget build(BuildContext context) => PageStorage(
        bucket: bucketGlobal,
        child: Scaffold(
          appBar: AppBar(
            title: Text(MyApp.title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersistPageStoragePage(),
                )),
              ),
            ],
          ),
          body: buildPageOne(),
        ),
      );

  Widget buildPageOne() => ListView.builder(
        key: PageStorageKey<String>('pageOne'),
        itemCount: 40,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'List item ${index + 1}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
}
