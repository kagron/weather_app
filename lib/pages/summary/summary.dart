import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

class Summary extends StatefulWidget {

  @override
  SummaryState createState() => new SummaryState();
}

class SummaryState extends State<Summary> {
  List data;

  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/utils/constants.json');
  }

  Future<String> getJSONData() async {
    var url = await this.loadAsset();
    var urlToJSON = json.decode(url);
    var fullUrl = urlToJSON['url'] + "60543" + urlToJSON['api-key'];
    print(fullUrl);
    // print(urlToJSON['url']);
    var response = await http.get(
      Uri.encodeFull(fullUrl),
      headers: {"Accept": "application/json"}
    );
    
    this.setState(() {
      var dataConvertedToJSON = json.decode(response.body);

      // data = dataConvertedToJSON;
      print(dataConvertedToJSON);
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    // this.getJSONData();
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
                Text("yoooo second screen!"),
              ],
            ),
          ),
        ),
      );
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}