import 'package:ccpt_movil/Pdfviewer/listitem.dart';
import 'package:flutter/material.dart';

Widget listWidget(ListItem item) {
  return Card(
    elevation: 2.0,
    margin: EdgeInsets.only(bottom: 20.0),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.titulo,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      item.autor,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Icon(Icons.date_range),
                    Text(
                      item.fecha,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Hero(
            tag: '${item.titulo}',
            child: Container(
              width: 100.0,
              height: 125.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.img),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
