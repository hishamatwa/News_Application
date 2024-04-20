import 'package:flutter/material.dart';
import 'package:newsapp/core/widgets/articels-item.dart';
import 'package:newsapp/core/widgets/custom_background.dart';
import 'package:newsapp/core/widgets/sources_item.dart';
import 'package:newsapp/model/articel_model.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/model/sources_model.dart';
import 'package:newsapp/network/apiManager.dart';

class CategoryView extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return custombackground(
      widget: FutureBuilder(
          future: apimanager.fetchDataSources(widget.categoryModel.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            List<SourcesModel> sources = snapshot.data ?? [];
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sources.length,
                        itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                currentindex = index;
                                setState(() {});
                              },
                              //child: Text(sources[index].id,style: TextStyle(backgroundColor:Colors.green,color: Colors.black, fontSize: 25),)
                              child: TabItem(
                                source: sources[index].id,
                              ),
                            ))),
                  ),
                ),
                if (sources.isNotEmpty)
                  FutureBuilder(
                    future:
                        apimanager.fetchDataArticels(sources[currentindex].id),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      List<ArticelsModel> articels = snapshot.data ?? [];
                      return Expanded(
                          child: ListView.builder(
                        //itemExtent: 7,
                        itemCount: articels.length,
                        itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(10),
                            // child: Text(articels[index].description,style: TextStyle(backgroundColor: Colors.red,color: Colors.black, fontSize: 25),))
                            child: ArticelsItem(
                              image: articels[index].image,
                              id: sources[currentindex].id,
                              title: articels[index].title,
                              time: articels[index].date,

                            )),
                      ));
                    },
                  )
              ],
            );
          }),
    );
  }
}
