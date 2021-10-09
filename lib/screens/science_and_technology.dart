import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScienceAndTechnologyScreen extends StatefulWidget {
  const ScienceAndTechnologyScreen({Key? key}) : super(key: key);

  @override
  _ScienceAndTechnologyScreenState createState() =>
      _ScienceAndTechnologyScreenState();
}

class _ScienceAndTechnologyScreenState
    extends State<ScienceAndTechnologyScreen> {
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
        child: Text(data),
      ),
    );
  }
}
