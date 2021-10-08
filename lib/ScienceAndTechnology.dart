import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScienceAndTechnology extends StatefulWidget {
  const ScienceAndTechnology({Key? key}) : super(key: key);

  @override
  _ScienceAndTechnologyState createState() => _ScienceAndTechnologyState();
}

class _ScienceAndTechnologyState extends State<ScienceAndTechnology> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String data = "";

  fetchData() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=6979a64cc87e45d3bdb9c7056f2120d1");

    var response = await http.get(url);

    setState(() {
      data = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Text(data),
        ),
      ),
    );
  }
}