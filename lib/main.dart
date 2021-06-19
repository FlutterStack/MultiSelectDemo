import 'package:flutter/material.dart';
import 'package:multi_select_demo/models/selectionList.dart';
import 'package:multi_select_demo/provider/listProvider.dart';
import 'package:multi_select_demo/selection.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ListProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final selectionList = context
        .watch<ListProvider>()
        .selectionList
        .where((element) => element.selected)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListSelection()),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: selectionList.length,
        itemBuilder: (context, index) {
          final item = selectionList[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () =>
                  context.read<ListProvider>().updateSelection(item),
            ),
          );
        },
      ),
    );
  }
}
