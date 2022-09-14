import 'package:flutter/material.dart';

class content extends StatelessWidget {
  const content({Key? key}) : super(key: key);
  static const routeName = '/content-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Here is the content',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
        ],
      )),
    );
  }
}
