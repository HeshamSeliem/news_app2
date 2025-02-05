import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/serves/api_manager.dart';

class ApiImplWidget extends StatelessWidget {
  const ApiImplWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("error : ${snapshot.error}");
        } else {
          var data = snapshot.data?.sources ?? [];
          return Column(
            children: [
              DefaultTabController(
                  initialIndex: 0,
                  length: data.length,
                  child: TabBar(
                      labelColor: const Color(0xff171717),
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      indicatorColor: const Color(0xff171717),
                      tabs: data
                          .map((element) => Tab(text: element.name))
                          .toList())),
              Expanded(
                child: FutureBuilder(
                    future: ApiManager.getNewsData("abc-news"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("error : ${snapshot.error}"));
                      } else {
                        var newsData = snapshot.data?.articles ?? [];
                        return ListView.builder(
                          itemCount: newsData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(newsData[index].title?? ""),
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          );
        }
      },
    );
  }
}
