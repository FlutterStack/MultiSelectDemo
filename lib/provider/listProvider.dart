import 'package:flutter/material.dart';
import 'package:multi_select_demo/models/userList.dart';
import 'package:multi_select_demo/services/users.dart';

class ListProvider with ChangeNotifier {
  List<UserListData> _listData = [];

  List<UserListData> get listData => _listData;

  ListProvider() {
    UsersServices().fetchData(1).then((value) {
      _listData = value.data!;
      notifyListeners();
    });
  }

  void updateSelection(UserListData item) {
    var index = _listData.indexOf(item);
    _listData[index].selection = !_listData[index].selection;
    _listData[index].selectionTemp = _listData[index].selection;
    notifyListeners();
  }

  void updateTempSelection(UserListData item) {
    var index = _listData.indexOf(item);
    _listData[index].selectionTemp = !_listData[index].selectionTemp;
    notifyListeners();
  }

  void confirm() {
    _listData.asMap().forEach((int i, UserListData e) => {
          if (e.selectionTemp) {_listData[i].selection = true}
        });
    notifyListeners();
  }

  void rejectChanges() {
    _listData.asMap().forEach((int i, UserListData e) => {
          if (e.selectionTemp && !e.selection)
            {_listData[i].selectionTemp = false}
        });
    notifyListeners();
  }
}
