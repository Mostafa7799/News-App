import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticalItem (artical) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: NetworkImage(
                '${artical['urlToImage']}',
              ),
              fit: BoxFit.cover
          ),
        ),
      ),
      SizedBox(width: 20.0),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${artical['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '${artical['publishedAt']}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);