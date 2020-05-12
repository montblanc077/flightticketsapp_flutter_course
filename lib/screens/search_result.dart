import 'package:flutter/material.dart';
import 'package:flighttickets/constants/constants.dart';
import 'package:flighttickets/widgets/flight_card.dart';

class InheritedFlightListing extends InheritedWidget {
  final String fromLocation, toLocation;

  InheritedFlightListing({this.fromLocation, this.toLocation, Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedFlightListing of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}

class FlightListingScreen extends StatelessWidget {
//  static const String id = 'flight_listing_screen';

//  final String fromLocation, toLocation;
//  FlightListingScreen({this.fromLocation, this.toLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF222533),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: mainColor,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/plane.png'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'From',
                      style: labelStyle,
                    ),
                    Text(
                      '${InheritedFlightListing.of(context).fromLocation}',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'To',
                      style: labelStyle,
                    ),
                    Text(
                      '${InheritedFlightListing.of(context).toLocation}',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.0,
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    FlightCard(),
                    FlightCard(),
                    FlightCard(),
                    FlightCard(),
                    FlightCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
