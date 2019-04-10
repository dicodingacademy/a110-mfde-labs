import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Igrendients',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("tes"),
      ),
      body: new Center(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: <Widget>[
                  new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Detail()),
                        );
                      },
                      child: new Card(
                        child: Image.asset(
                          'assets/chiken.jpg',
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Menu"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/chiken.jpg',
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              '1. Preheat oven to 350 degrees F (175 degrees C). Coat a 7x11 inch baking dish with nonstick cooking spray. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              '2. Pound chicken breasts to 1/4 inch thickness.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              '3. Sprinkle each piece of chicken on both sides with salt and pepper. Place 1 cheese slice and 1 ham slice on top of each breast. Roll up each breast, and secure with a toothpick. Place in baking dish, and sprinkle chicken evenly with bread crumbs.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          )
        ]));
  }
}