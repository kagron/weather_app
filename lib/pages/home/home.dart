import 'package:flutter/material.dart';
import 'package:weather_app/pages/summary/summary.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Weather!!!!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter zip code...'),
                ),
                RaisedButton(
                  child: Text('yo'),
                  onPressed: () {
                    print('yo');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Summary()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}