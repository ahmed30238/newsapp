import 'package:flutter/material.dart';

Widget buildScreenItems(list,context) => Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: list['urlToImage'] != null
                    ? NetworkImage('${list['urlToImage']}')
                    : const NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/11/25/23/15/moon-1859616_960_720.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: 150,
            height: 150,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${list['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${list['publishedAt']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 3,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
