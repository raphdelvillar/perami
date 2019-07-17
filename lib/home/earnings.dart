import 'package:flutter/material.dart';

class Earnings extends StatefulWidget {
  @override
  _EarningsState createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: Image.asset('assets/wallet.png', height: 90)),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Center(
              child: Text("QR 5,000",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.green
                  )
              )
          )
        ),
        Padding(
          padding:EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Center(
            child: Text("Your payout is on December 01, 2019",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black
              )
            )
          )
        )
      ]
    );
  }
}
