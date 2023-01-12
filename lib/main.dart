import 'package:cruv_flutter_task/berth.dart';
import 'package:flutter/material.dart';

import 'widgets/multiple_berths.dart';
import 'widgets/search_bar.dart';
import 'widgets/single_berth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var multipleBerthsList = <List<int>>[];
  var singleBerthsList = <int>[];
  var result = <int>[];
  var searchedBerth = 0;
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  int _indexToScrollTo = -1;
  void generateBerthNumbersList() {
    for (int i = 1; i < 73; i++) {
      if (i % 8 == 7 || i % 8 == 0) {
        singleBerthsList.add(i);
        continue;
      }
      result.add(i);
    }

    for (var i = 0; i < result.length; i += 3) {
      multipleBerthsList.add(result.sublist(i, i + 3));
    }
  }

  @override
  void initState() {
    generateBerthNumbersList();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Seat Finder",
              style: TextStyle(
                color: Color(0xFF80CBFF),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              controller: controller,
              textChanged: (p0) {
                setState(() {
                  if (p0 != null) {
                    if (p0 == "") {
                      searchedBerth = 0;
                    } else {
                      searchedBerth = int.parse(p0);
                      if (singleBerthsList.contains(searchedBerth)) {
                        _indexToScrollTo =
                            singleBerthsList.indexOf(searchedBerth);
                      } else {
                        _indexToScrollTo = multipleBerthsList.indexOf(
                            multipleBerthsList.firstWhere(
                                (element) => element.contains(searchedBerth)));
                      }
                      scrollController.animateTo(
                        _indexToScrollTo * 70,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }
                  }
                });
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: multipleBerthsList.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      MultipleBerths(
                        selectedBerth: searchedBerth,
                        berths: [
                          Berth(
                            berthNumber: multipleBerthsList[index][0],
                            berthType: "LOWER",
                          ),
                          Berth(
                            berthNumber: multipleBerthsList[index][1],
                            berthType: "MIDDLE",
                          ),
                          Berth(
                            berthNumber: multipleBerthsList[index][2],
                            berthType: "UPPER",
                          ),
                        ],
                        isInverted: index % 2 == 0,
                      ),
                      const Spacer(),
                      SingleBerth(
                        selectedBerth: searchedBerth,
                        isInverted: index % 2 == 0,
                        berth: Berth(
                          berthNumber: singleBerthsList[index],
                          berthType:
                              "SIDE ${index % 2 == 0 ? "LOWER" : "UPPER"}",
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                if (index % 2 == 0) {
                  return const SizedBox(
                    height: 40,
                  );
                } else {
                  return const SizedBox(
                    height: 5,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
