import 'package:flutter/material.dart';
import 'package:multi_select_demo/models/selectionList.dart';

class ListProvider with ChangeNotifier {
  List<SelectionList> _selectionList = [];

  List<SelectionList> get selectionList => _selectionList;

  ListProvider(){
    _selectionList.add(SelectionList("Test 1", "Test Description 1", false));
    _selectionList.add(SelectionList("Test 2", "Test Description 2", false));
    _selectionList.add(SelectionList("Test 3", "Test Description 3", false));
    _selectionList.add(SelectionList("Test 4", "Test Description 4", false));
  }

  void updateSelection(SelectionList item) {
    var index = _selectionList.indexOf(item);
    _selectionList[index].selected = !_selectionList[index].selected;
    notifyListeners();
  }
}
