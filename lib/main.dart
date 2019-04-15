import 'package:flutter/material.dart';
// import 'placholder.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Igrendients',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  new Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreen();
  }
}
class HomeScreen extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    PlaceholderWidget("assets/chiken.jpg"),
    PlaceholderWidget("assets/sphageti.jpg"),
    PlaceholderWidget("assets/fish.jpg")
  ];



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Main Menu"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.android),
            title: new Text('Ciken'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.apps),
            title: new Text('Spagety'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_circle),
              title: Text('Fish n Chips')
          )
        ],
      ),

    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
  }
}


class PlaceholderWidget extends StatelessWidget {
  final String item;


  PlaceholderWidget(this.item);


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: <Widget>[
                new Card(
                    child: PhotoHero(
                      photo: item,
                      width: 300.0,
                      onTap: (){
                        final snackBar = SnackBar(
                          content: Text('check another menu')
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                        Navigator.push( context, MaterialPageRoute(builder: (context) => Detail(item)),
                        );
                      },
                    )
                )
              ],
            ),
          ),
        ],

      ),
    );
  }
}




class Detail extends StatelessWidget {
  final String item;

  Detail(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Recipe"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotoHero(
                photo: item,
                width: 500.0,

              ),

              Container(
                padding: const EdgeInsets.only(left:8.0, top: 8.0),
                child: Text(
                  '1. Preheat oven to 350 degrees F (175 degrees C). Coat a 7x11 inch baking dish with nonstick cooking spray. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:8.0, top: 8.0),
                child: Text(
                  '2. Pound chicken breasts to 1/4 inch thickness.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:8.0, top: 8.0),
                child: Text(
                  '3. Sprinkle each piece of chicken on both sides with salt and pepper. Place 1 cheese slice and 1 ham slice on top of each breast. Roll up each breast, and secure with a toothpick. Place in baking dish, and sprinkle chicken evenly with bread crumbs.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              )


            ])

    );
  }
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}