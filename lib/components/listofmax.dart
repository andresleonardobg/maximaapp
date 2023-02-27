import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:list/components/button.dart';
import 'package:list/data/database.dart';

class ListOfMax extends StatelessWidget {
  List maxText;
  Function(BuildContext)? deleteMax;
  Function(BuildContext)? editMax;
  ListMaxDataBase db = ListMaxDataBase();

  ListOfMax({super.key, required this.maxText, required this.deleteMax});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
                onPressed: editMax,
                icon: Icons.edit,
                autoClose: true,
                backgroundColor: Color(0xffccac95),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            SlidableAction(
                onPressed: deleteMax,
                icon: Icons.delete,
                backgroundColor: Color(0xff9d7e79)),
          ],
        ),
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              //maxima
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Text(
                      maxText[0],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
              //autor
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    maxText[1],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              //fuente
              Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text(maxText[2], style: TextStyle(color: Colors.white))),
              //medio
              Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text(maxText[3], style: TextStyle(color: Colors.white))),
              //link
              Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text(maxText[4], style: TextStyle(color: Colors.white))),
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xFF9a947c),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
