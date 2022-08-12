import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';
import '../widgets/discover_element.dart';
import '../data/data_provider.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);

    return DefaultTabController(
      length: data.tabsList.length,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Container(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.tune),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Where to travel?",
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    tabs: data.tabsList,
                  ),
                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: data.elements.length,
                itemBuilder: (context, index) {
                  return DiscoverElement(
                      id: data.elements[index].id,
                      name: data.elements[index].name,
                      opinion: data.elements[index].opinion,
                      price: data.elements[index].price,
                      isFav: data.elements[index].isFav,
                      images: data.elements[index].images);
                },
              ),
            )),
      ),
    );
  }
}
