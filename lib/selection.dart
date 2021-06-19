import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_select_demo/provider/listProvider.dart';

class ListSelection extends StatelessWidget {
  const ListSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectionList = context.watch<ListProvider>().selectionList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select List"),
      ),
      body: ListView.builder(
        itemCount: selectionList.length,
        itemBuilder: (context, index) {
          final item = selectionList[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Checkbox(
              value: item.selected,
              onChanged: (status) {
                context.read<ListProvider>().updateSelection(item);
              },
            ),
          );
        },
      ),
    );
  }
}
