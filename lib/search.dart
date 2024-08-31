// ignore_for_file: must_be_immutable, prefer_final_fields, unused_field

import 'package:creative_benha/data_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  List<DataModel> _allItems = <DataModel>[
    DataModel(
      image: "assets/img1.jpg",
      text: "First Item",
      desc: "First Item Description",
    ),
    DataModel(
      image: "assets/img2.jpg",
      text: "Second Item",
      desc: "Second Item Description",
    ),
    DataModel(
      image: "assets/img3.jpg",
      text: "Third Item",
      desc: "Third Item Description",
    ),
    DataModel(
      image: "assets/splash.jpg",
      text: "Fourth Item",
      desc: "Fourth Item Description",
    ),
    DataModel(
      image: "assets/img1.jpg",
      text: "Fifth Item",
      desc: "Fifth Item Description",
    ),
  ];
  List<DataModel> _filteredItems = [];
  var formKey = GlobalKey();
  void searchList() {
    String query = textController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredItems = [];
      });
    } else {
      setState(() {
        _filteredItems = _allItems
            .where((element) => element.text!.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(searchList);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Search Screen"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // search item
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: textController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Item can't be empty.";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Search",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.search_rounded),
                          onPressed: () {},
                          color: const Color.fromARGB(255, 255, 136, 0),
                          iconSize: 30.0,
                          highlightColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                // showed list
                if (_filteredItems.isNotEmpty)
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) => ListTile(
                        title: Text(_filteredItems[i].text!),
                      ),
                      itemCount: _filteredItems.length,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
