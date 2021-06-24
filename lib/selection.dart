import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_select_demo/provider/listProvider.dart';

class ListSelection extends StatefulWidget {
  const ListSelection({Key? key}) : super(key: key);

  @override
  _ListSelectionState createState() => _ListSelectionState();
}

class _ListSelectionState extends State<ListSelection> {
  bool save = false;

  @override
  Widget build(BuildContext context) {
    final selectionList = context
        .watch<ListProvider>()
        .listData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select List"),
        actions: [
          Switch(value: save, onChanged: (bool state) => {
            setState(() {
              save = state;
            })
          }),
          IconButton(onPressed: () {
            if(save){
              context.read<ListProvider>().confirm();
            }else {
              context.read<ListProvider>().rejectChanges();
            }
          }, icon: Icon(Icons.check))
        ],
      ),
      body: ListView.builder(
        itemCount: selectionList.length,
        itemBuilder: (context, index) {
          final item = selectionList[index];
          return ListTile(
            title: Text("${item.firstName!} ${item.lastName!}"),
            subtitle: Text(item.email!),
            trailing: Checkbox(
              value: item.selectionTemp,
              onChanged: (status) {
                context.read<ListProvider>().updateTempSelection(item);
              },
            ),
          );
        },
      ),
    );
  }
}
