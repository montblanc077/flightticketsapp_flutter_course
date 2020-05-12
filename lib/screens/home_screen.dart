import 'package:flighttickets/screens/search.dart';
import 'package:flighttickets/screens/search_result.dart';
import 'package:flighttickets/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flighttickets/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<String> locations = ['Rostov-on-Don (ROV)', 'New York City (JFK)'];
var selectedLocationIndex = 0;

class HomeScreen extends StatelessWidget {
//  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          HomeScreenBottomPart(),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
//  var selectedLocationIndex = 0;

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
//      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Really?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You find all you need and want to go away?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Go away!'),
              onPressed: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Color(0xFF222533),
            ),
            SizedBox(
              width: 25.0,
            ),
            Theme(
              data: Theme.of(context).copyWith(cardColor: Colors.white),
              child: PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
                onSelected: (index) {
                  setState(() {
                    selectedLocationIndex = index;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      locations[selectedLocationIndex],
                      style:
                          TextStyle(color: Color(0xFF222533), fontSize: 16.0),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF222533),
                    ),
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  PopupMenuItem(
                    child: Text(
                      locations[0],
                      style:
                          TextStyle(color: Color(0xFF222533), fontSize: 16.0),
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text(
                      locations[1],
                      style:
                          TextStyle(color: Color(0xFF222533), fontSize: 16.0),
                    ),
                    value: 1,
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.person_outline),
              color: Color(0xFF222533),
              onPressed: () {
                _showDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBottomPart extends StatefulWidget {
  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 400.0,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cityCards,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 72.0, bottom: 15.0),
          child: RaisedButton(
            color: Colors.white,
            child: Text(
              'Other deals',
              style: TextStyle(
                  color: Color(0xFF222533),
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0),
            ),
            onPressed: () {
//              Navigator.pushNamed(
//                context,
//                FlightListingScreen.id,
//              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FlightListingScreen()));
            },
          ),
        ),
        RaisedButton(
          color: Color(0xFF222533),
          child: Text(
            'Search flight',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18.0),
          ),
          onPressed: () {
//            Navigator.pushNamed(context, FlightSearchScreen.id,
//                arguments: FlightSearchScreen(
//                    fromLocation: locations[selectedLocationIndex]));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FlightSearchScreen(
                          fromLocation: locations[selectedLocationIndex],
                        )));
          },
        ),
      ],
    );
  }
}

List<CityCard> cityCards = [
  CityCard('assets/images/berlin.png', 'Berlin', 'Feb 2019', '45', 299, 250),
  CityCard('assets/images/dubai.png', 'Dubai', 'Apr 2019', '50', 9999, 4159),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount;
  final double oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(43.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height: 375.0,
              width: 229.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              height: 375.0,
              width: 229.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF222533).withOpacity(0.87),
                      Color(0xFF222533).withOpacity(0.87),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 38.0,
              bottom: 240.0,
              right: 38.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'From ${formatCurrency.format(newPrice)}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
//                  SizedBox(
//                    width: 5.0,
//                  ),
//                  Text(
//                    '(${formatCurrency.format(oldPrice)})',
//                    style: TextStyle(
//                        color: Colors.grey,
//                        fontWeight: FontWeight.normal,
//                        fontSize: 12.0),
//                  ),
                ],
              ),
            ),
            Positioned(
              left: 38.0,
              bottom: 40.0,
              right: 38.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cityName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 36.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        monthYear,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
