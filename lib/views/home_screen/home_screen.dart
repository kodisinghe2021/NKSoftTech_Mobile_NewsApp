import 'package:flutter/material.dart';
import 'package:reading_application_app/models/article.dart';
import 'package:reading_application_app/services/api_connect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiConnect client = ApiConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News by NKSoftTech"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: FutureBuilder(
        future: client.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      const CustomSBxWithheading(
                        text: "Title : ",
                      ),
                      Text(articles[index].title!),
                      const CustomSBxWithheading(
                        text: "Description : ",
                      ),
                      Text(articles[index].description!),
                       const CustomSBxWithheading(
                        text: "Content : ",
                      ),
                      Text(articles[index].content!),
                    ],
                  ),
                ); //Text(articles[index].title!)
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class CustomSBxWithheading extends StatelessWidget {
  const CustomSBxWithheading({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 20,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
