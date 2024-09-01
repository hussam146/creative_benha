// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:creative_benha/data_model.dart';
import 'package:creative_benha/details.dart';
import 'package:creative_benha/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curIndex = 0;

  List<DataModel> model = <DataModel>[
    DataModel(
      image: "assets/img1.jpg",
      text: "First Item",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    DataModel(
      image: "assets/img2.jpg",
      text: "Second Item",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    DataModel(
      image: "assets/img3.jpg",
      text: "Third Item",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    DataModel(
      image: "assets/splash.jpg",
      text: "Fourth Item",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
    DataModel(
      image: "assets/img1.jpg",
      text: "Fifth Item",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: curIndex == 0
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // text
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "What do you search for?",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Search item

                      // carousel slider
                      CarouselSlider(
                        items: model
                            .map((e) => Container(
                                  width: MediaQuery.of(context).size.width,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Image.asset(
                                    e.image!,
                                    fit: BoxFit.fill,
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: 250.0,
                          viewportFraction: 1,
                          scrollPhysics: const BouncingScrollPhysics(),
                          enlargeFactor: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                        ),
                      ),
                      // text
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Antiquies",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      // grid view
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 10.0),
                        child: SizedBox(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.0,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: model.length,
                            itemBuilder: (builder, i) {
                              return Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) => DetailsScreen(
                                            dataModel: DataModel(
                                              image: model[i].image,
                                              text: model[i].text,
                                              desc: model[i].desc,
                                            ),
                                          ),
                                        ));
                                  },
                                  child: Image.asset(
                                    model[i].image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SearchScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
        ],
        currentIndex: curIndex,
        elevation: 0.0,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            curIndex = i;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 255, 136, 0),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
