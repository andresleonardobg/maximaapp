import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:list/components/dialog_box.dart';
import 'package:list/data/database.dart';
import '../components/listofmax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ListMaxDataBase db = ListMaxDataBase();

  List maxima = [];

  @override
  void initState() {
    //1st time ever open
    if (_myBox.get("MAXLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  // ignore: prefer_final_fields
  List _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.maxList[index][1] = !db.maxList[index][1];
    });
    db.updateData();
  }

  void saveNewMax() {
    setState(() {
      db.maxList.add([
        _controller[0].text,
        _controller[1].text,
        _controller[2].text,
        _controller[3].text,
        _controller[4].text,
        false
      ]);

      _controller.forEach((element) {
        element.clear();
      });
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewMax() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controllerMaxima: _controller[0],
              controllerAuthor: _controller[1],
              controllerSource: _controller[2],
              controllerMedia: _controller[3],
              controllerLink: _controller[4],
              cancel: () => Navigator.of(context).pop(),
              save: saveNewMax);
        });
  }

  void deleteMax(int index) {
    setState(() {
      db.maxList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5b756c),
      appBar: AppBar(
        title: Text('Maximas'),
        centerTitle: true,
        backgroundColor: Color(0xFF748b83),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewMax,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ListView.builder(
          itemCount: db.maxList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListOfMax(
                maxText: db.maxList[index],
                deleteMax: (context) => deleteMax(index));
          },
        ),
      ),
    );
  }
}
