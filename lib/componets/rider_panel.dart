import 'package:flutter/material.dart';

class RiderPanel extends StatelessWidget {
  const RiderPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 325.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(-2, -2),
                blurRadius: 4),
          ]),
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi there.',
            style:
            TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
          ),
          Row(
            children: [
              Text(
                'Where to?',
                style:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 52.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(22.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(1, 1),
                      blurRadius: 2),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 22.0,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    'Search Drop Off',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.home,
                  size: 22.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Home',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Your Home Location.',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.badge,
                  size: 22.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Word',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Your Office Location.',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
