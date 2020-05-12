import 'package:flutter/material.dart';
import 'package:flighttickets/screens/search_result.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flighttickets/widgets/card_text_form_field.dart';
import 'package:flighttickets/constants/constants.dart';

class FlightSearchScreen extends StatefulWidget {
//  static const String id = 'flight_search_screen';

  FlightSearchScreen({this.fromLocation});
  final String fromLocation;

  @override
  _FlightSearchScreenState createState() =>
      _FlightSearchScreenState(fromLocation);
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  String _toLocation, _fromLocation, _adults, _children, _infants;

  DateTime _depDate, _backDate;

  final String fromLocation;
  _FlightSearchScreenState(this.fromLocation);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF222533),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                height: 500.0,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 82.0,
                        child: CardTextFormField(
                          hintText: fromLocation,
                          labelText: 'From',
                          changeData: (value) => _fromLocation = value,
                          tapData: () => _fromLocation = fromLocation,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 82.0,
                        child: CardTextFormField(
                          hintText: 'Tokyo Haneda (HND)',
                          labelText: 'To',
                          changeData: (value) => _toLocation = value,
                          tapData: () => _toLocation = 'Tokyo Haneda (HND)',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 82.0,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    cursorColor: mainColor,
                                    decoration: InputDecoration(
                                      hintText: '11 Jan, 2020',
                                      labelText: 'Dep. Date',
                                    ),
                                    onTap: () async {
                                      DateTime newDateTime =
                                          await buildShowRoundedDatePicker(
                                              context);
                                      if (newDateTime != null) {
                                        setState(() => _depDate = newDateTime);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 19.5,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 82.0,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    cursorColor: mainColor,
                                    decoration: InputDecoration(
                                      hintText: '11 Feb, 2020',
                                      labelText: 'Back Date',
                                    ),
                                    onTap: () async {
                                      DateTime newDateTime =
                                          await buildShowRoundedDatePicker(
                                              context);
                                      if (newDateTime != null) {
                                        setState(() => _backDate = newDateTime);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                                height: 82.0,
                                child: CardTextFormField(
                                  hintText: '1',
                                  labelText: 'Adults',
                                  changeData: (value) => _adults = value,
                                )),
                          ),
                          SizedBox(
                            width: 19.5,
                          ),
                          Expanded(
                            child: SizedBox(
                                height: 82.0,
                                child: CardTextFormField(
                                  hintText: '0',
                                  labelText: 'Children',
                                  changeData: (value) => _children = value,
                                )),
                          ),
                          SizedBox(
                            width: 19.5,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 82.0,
                              child: CardTextFormField(
                                hintText: '0',
                                labelText: 'Infants',
                                changeData: (value) => _infants = value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 54.0,
              ),
              RaisedButton(
                color: mainColor,
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0),
                ),
                onPressed: () {
                  print(_fromLocation);
                  print(_toLocation);
                  print(_adults);
                  print(_children);
                  print(_infants);
                  print(_depDate);
                  print(_backDate);
//                  Navigator.pushNamed(context, FlightListingScreen.id,
//                      arguments: FlightListingScreen(
//                        fromLocation: fromLocation,
//                      ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
//                        builder: (context) => FlightListingScreen(
//                              fromLocation: fromLocation,
//                            )),
                          builder: (context) => InheritedFlightListing(
                                fromLocation: _fromLocation,
                                toLocation: _toLocation,
                                child: FlightListingScreen(),
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> buildShowRoundedDatePicker(BuildContext context) {
    return showRoundedDatePicker(
      context: context,
      theme: ThemeData(
        primarySwatch: mainColor,
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );
  }
}
