import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String inputMessage = 'Enter City Name';
  String cityName = '';
  Color hintColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 350.0),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                      child: TextField(
                        onChanged: (value) {
                          cityName = value;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDeco.copyWith(
                          hintText: inputMessage,
                          hintStyle: TextStyle(color: hintColor),
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (cityName == '') {
                          setState(() {
                            inputMessage = 'Enter City Name First!';
                            hintColor = Colors.red;
                          });
                        } else {
                          hintColor = Colors.grey;
                          Navigator.pop(context, cityName);
                        }
                      },
                      child: Text(
                        'Get Weather',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
