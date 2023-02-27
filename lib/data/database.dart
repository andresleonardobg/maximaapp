import 'package:hive_flutter/hive_flutter.dart';

class ListMaxDataBase {
  List maxList = [];

  //reference the box
  final _myBox = Hive.box('myBox');

  //run this fo the firts time in this app
  void createInitialData() {
    maxList = [
      ["Maxima", "Autor", "Fuente", "Medio", "Link", false],
      ["Maxima", "Autor", "Fuente", "Medio", "Link", false]
    ];
  }

  //load the data
  void loadData() {
    maxList = _myBox.get("MAXLIST");
  }

  //update data base
  void updateData() {
    _myBox.put("MAXLIST", maxList);
  }
}
