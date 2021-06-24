import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_demo/provider/listProvider.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool save = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var selectionList = context
        .watch<ListProvider>()
        .listData
        .where((element) => !element.selection)
        .toList();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height * .7,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                selectionList.length,
                    (index) =>
                    ListTile(
                      title: Text(
                        selectionList[index].firstName.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Checkbox(
                        value: selectionList[index].selectionTemp,
                        activeColor: Colors.pink,
                        onChanged: (bool? value) {
                          context
                              .read<ListProvider>()
                              .updateTempSelection(selectionList[index]);
                        },
                      ),
                    ),
              ),
              ListTile(
                title: Text(
                  'True',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: CupertinoSwitch(
                  value: save,
                  activeColor: Colors.pink,
                  onChanged: (value) {
                    setState(() {
                      save = !save;
                    });
                  },
                ),
              ),
              MaterialButton(
                onPressed: ()
                {
                  if(save){
                    context.read<ListProvider>().confirm();
                  }
                  Navigator.pop(context);
                },
                child: Text('Submit'),
                color: Colors.pink,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
