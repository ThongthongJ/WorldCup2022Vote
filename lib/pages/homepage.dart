import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../models/worlcup_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WorldCup> _teamList = [];

  @override
  void initState() {
    super.initState();
    _fetchWorldCupData();
  }

  /*void _fetchWorldCupData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = await Api().fetch('');
      setState(() {
        _teamList =
            data.map<WorldCup>((item) => WorldCup.fromJson(item)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }
  }*/

  void _fetchWorldCupData() async {
    setState(() {
      //_isLoading = true;
    });
    var data = await http.get(Uri.parse("http://103.74.252.66:8888"));
    var jsonBody = json.decode(data.body)['data'];
    //var jsonData = jsonBody['data'];
    // print(jsonBody);

    for (int j = 0; j < jsonBody.length; j++) {
      _teamList.add(WorldCup(
          id: jsonBody[j]['id'],
          team: jsonBody[j]['team'],
          group: jsonBody[j]['group'],
          flagImageion: jsonBody[j]['flagImageion'],
          voteCount: jsonBody[j]['voteCount']));
    }
    setState(() {
     // _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  scale: 6.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Team : ${_teamList[index].team}'),
                              Text('Group : ${_teamList[index].group}'),
                            ],
                          ),
                        ),
                        TextButton(onPressed: () {}, child: Text('Vote'))
                      ],
                    ),
                  );
                },
                itemCount: _teamList.length),
          )
        ],
      ),
    );
  }
}
