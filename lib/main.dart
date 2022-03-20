import 'package:flutter/material.dart';
import 'package:submission/search.dart';
import 'package:submission/names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Friend Lists',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.search,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SearchScreen();
              },
            ),
          );
        },
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          names.sort();
          final name = names[index];
          return Card(
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
        },
        itemCount: names.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 1,
          );
        },
      ),
    );
  }
}
