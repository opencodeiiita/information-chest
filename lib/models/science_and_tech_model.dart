import 'dart:convert';

class ScienceAndTechModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ScienceAndTechModel(this.source, this.author, this.title, this.description,
      this.url, this.urlToImage, this.publishedAt, this.content);

  ScienceAndTechModel.fromJson(Map<String, dynamic> json)
      : source = (json['source'] is Map)
            ? Source.fromJson(json['source'])
            : Source("", ""),
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

Future<List<ScienceAndTechModel>> getAllScienceAndTechList(var response) async {
  List<ScienceAndTechModel> allList = [];
  var res = await json.decode(response.body)['bodies'];
  for (var fact in res) {
    allList.add(ScienceAndTechModel.fromJson(fact));
  }
  return allList;
}
