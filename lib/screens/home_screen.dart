import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContentModel> contentList = [
    ContentModel(
        "Universe", const Icon(Icons.arrow_forward), Colors.blue[200]!),
    ContentModel(
        "Planet Earth", const Icon(Icons.arrow_forward), Colors.green[200]!),
    ContentModel(
        "World History", const Icon(Icons.arrow_forward), Colors.purple[200]!),
    ContentModel("The Natural World", const Icon(Icons.arrow_forward),
        Colors.grey[200]!),
    ContentModel(
        "The Human Body", const Icon(Icons.arrow_forward), Colors.red[200]!),
    ContentModel("Science and Technology", const Icon(Icons.arrow_forward),
        Colors.orange[200]!),
    ContentModel("Around the World", const Icon(Icons.arrow_forward),
        Colors.purple[200]!),
    ContentModel("Arts, Sports and Entertainment",
        const Icon(Icons.arrow_forward), Colors.yellow[200]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Content"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  color: contentList[index].color,
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: contentList[index].icon,
                      ),
                      SizedBox(
                        child: Text(
                          contentList[index].name,
                          style: const TextStyle(
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
