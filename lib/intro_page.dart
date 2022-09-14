import 'package:flutter/material.dart';
import 'sign_up.dart';

class intropage extends StatelessWidget {
  const intropage({Key? key}) : super(key: key);
  static const routeName = '/intro-page';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: deviceSize.height,
          width: deviceSize.width,
          color: Colors.amber,
          child: FittedBox(
            child: Image.network(
                'https://img.freepik.com/free-vector/universe-mobile-wallpaper-with-planets_79603-600.jpg?w=740&t=st=1663110425~exp=1663111025~hmac=612c030c36bd9d77c203a22e3822b502f048405eba9a4f0c1636df4b5ea8e5da'),
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // margin: EdgeInsets.only(
                //   left: deviceSize.width * 0.4,
                //   right: deviceSize.width * 0.4,
                //   top: deviceSize.height * 0.10,
                //   bottom: deviceSize.height * 0.10,
                // ),
                // height: deviceSize.height * 0.15,
                // width: deviceSize.width * 0.15,
                // decoration: BoxDecoration(
                //   color: Colors.teal,
                //   shape: BoxShape.circle,
                // ),
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(const SnackBar(
                        //   content: Text(
                        //     'Tap',
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ));
                        Navigator.of(context).pushNamed(signup.routeName);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.1,
                      width: 0,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
