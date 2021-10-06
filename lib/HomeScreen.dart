import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContentModel> ContentList = [
    ContentModel("Universe", Icon(Icons.arrow_forward), Colors.blue[200]!),
    ContentModel("Planet Earth", Icon(Icons.arrow_forward), Colors.green[200]!),
    ContentModel(
        "World History", Icon(Icons.arrow_forward), Colors.purple[200]!),
    ContentModel(
        "The Natural World", Icon(Icons.arrow_forward), Colors.grey[200]!),
    ContentModel("The Human Body", Icon(Icons.arrow_forward), Colors.red[200]!),
    ContentModel("Science and Technology", Icon(Icons.arrow_forward),
        Colors.orange[200]!),
    ContentModel(
        "Around the World", Icon(Icons.arrow_forward), Colors.purple[200]!),
    ContentModel("Arts, Sports and Entertainment", Icon(Icons.arrow_forward),
        Colors.yellow[200]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: ContentList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  color: ContentList[index].color,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        child: ContentList[index].icon,
                      ),
                      Container(
                        child: Text(
                          ContentList[index].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ContentModel {
  String name;
  Icon icon;
  Color color;

  ContentModel(this.name, this.icon, this.color);
}
