import 'package:flutter/material.dart';
import 'package:list/components/button.dart';

class DialogBox extends StatelessWidget {
  final controllerMaxima;
  final controllerAuthor;
  final controllerSource;
  final controllerMedia;
  final controllerLink;

  VoidCallback save;
  VoidCallback cancel;

  DialogBox({
    Key? key,
    required this.controllerMaxima,
    required this.controllerAuthor,
    required this.controllerSource,
    required this.controllerMedia,
    required this.controllerLink,
    required this.save,
    required this.cancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff9d7e79),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ignore: prefer_const_constructors
            Text('Maxima',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            //input
            TextField(
              controller: controllerMaxima,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: "Maxima",
                  filled: true,
                  fillColor: Colors.blueGrey[50]),
            ),
            TextField(
              controller: controllerAuthor,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Autor",
                  filled: true,
                  fillColor: Colors.blueGrey[50]),
            ),
            TextField(
              controller: controllerSource,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Fuente",
                  filled: true,
                  fillColor: Colors.blueGrey[50]),
            ),
            TextField(
              controller: controllerMedia,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Medio",
                  filled: true,
                  fillColor: Colors.blueGrey[50]),
            ),
            TextField(
              controller: controllerLink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Link",
                  filled: true,
                  fillColor: Colors.blueGrey[50]),
            ),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //save
                MyButton(name: 'guardar', onPressed: save),
                const SizedBox(width: 8),
                //cancel
                MyButton(name: 'cancelar', onPressed: cancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
