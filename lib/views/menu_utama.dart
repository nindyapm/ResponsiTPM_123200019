import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuUtama extends StatefulWidget {
  @override
  _MenuUtamaState createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  List<dynamic> agents = [];

  Future<void> fetchAgents() async {
    var url = Uri.parse('https://valorant-api.com/v1/agents');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        agents = data['data'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Agents'),
      ),
      body: ListView.builder(
        itemCount: agents.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(agents[index]['background']),
                ),
              ),
               child: Image.network(agents[index]['fullPortrait']),
            ) ,
            title: Text(agents[index]['displayName']),
            subtitle: Text(agents[index]['developerName']),

          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuUtama(),
  ));
}
