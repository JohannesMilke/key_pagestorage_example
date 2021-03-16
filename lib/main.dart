import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_pagestorage_example/page/expansion_pagestorage_key_page.dart';
import 'package:key_pagestorage_example/page/gridview_pagestorage_key_page.dart';
import 'package:key_pagestorage_example/page/listview_pagestorage_key_page.dart';
import 'package:key_pagestorage_example/page/persist_pagestorage_page.dart';
import 'package:key_pagestorage_example/widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Page Storage Key';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'ListView',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListViewPageStorageKeyPage(),
                  )),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'GridView',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GridViewPageStorageKeyPage(),
                  )),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'ExpansionTile',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExpansionPageStorageKeyPage(),
                  )),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'PageStorage',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersistPageStoragePage(),
                  )),
                ),
              ],
            ),
          ),
        ),
      );
}
