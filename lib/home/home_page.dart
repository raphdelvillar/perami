import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perami/authentication/authentication.dart';
import 'package:perami/home/top_view.dart';

import 'package:perami/home/earnings.dart';
import 'package:perami/home/loans.dart';
import 'package:perami/home/history.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Switch(
              value: false,
              onChanged: (bool value) {
                print("test");
              }
            );
          }
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print("test");
            }
          )
        ]
      ),
      body: ListView(
        children: [
          TopView(),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[700]
            ),
            child: TabBar(
              controller: _controller,
              tabs: [
                Tab(
                  icon: const Icon(Icons.account_balance_wallet),
                  text: "Earnings"
                ),
                Tab(
                  icon: const Icon(Icons.monetization_on),
                  text: "Loans"
                ),
                Tab(
                  icon: const Icon(Icons.history),
                  text: "History"
                )
              ]
            )
          ),
          Container(
            height: 345,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Earnings(),
                Loans(),
                History()
              ]
            )
          )
        ]
      )
    );
  }
}
