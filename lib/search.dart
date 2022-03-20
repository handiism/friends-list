import 'package:flutter/material.dart';
import 'package:submission/names.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _namesAsState = [];
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Search Friend"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  label: Text("Enter your friend's name"),
                  hintText: "A name",
                ),
                onChanged: (txt) {
                  _namesAsState = [...names];

                  setState(() {
                    _namesAsState.retainWhere((element) => element
                        .toLowerCase()
                        .contains(_controller.text.toLowerCase()));
                    _namesAsState.sort();
                    if (_namesAsState.isEmpty) {
                      _visible = false;
                    } else {
                      _visible = true;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _namesAsState = [...names];

                      setState(() {
                        _namesAsState.retainWhere((element) => element
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase()));
                        _namesAsState.sort();
                        if (_namesAsState.isEmpty) {
                          _visible = false;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Friends Not Found"),
                            duration: Duration(seconds: 1),
                          ));
                        } else {
                          _visible = true;
                        }
                      });
                    },
                    child: const Text("Search"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        _namesAsState = [];
                        _visible = false;
                      });
                    },
                    child: const Text("Reset"),
                  ),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Visibility(
                visible: _visible,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final name = _namesAsState[index];
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
                  itemCount: _namesAsState.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 1,
                    );
                  },
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
