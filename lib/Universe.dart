import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Universe extends StatelessWidget {
  final String apiUrl = "https://api.le-systeme-solaire.net/rest/bodies/";
  Future<List<dynamic>> fetchCelestialObjects() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.body);
    return json.decode(response.body)['bodies'];
  }

  String _name(dynamic celestialBody) {
    print(celestialBody);
    return celestialBody['englishName'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universe'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchCelestialObjects(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(_name(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Text(_name(snapshot.data[index])),
                            title: Text(snapshot.data[index].toString()),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
