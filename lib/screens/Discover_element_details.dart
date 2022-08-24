import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';

class DiscoverElementDetails extends StatefulWidget {
  int id;
  String name;
  double opinion;
  double price;
  List<Image> images;
  bool isFav;

  DiscoverElementDetails(
      {required this.id,
      required this.name,
      required this.opinion,
      required this.price,
      required this.images,
      required this.isFav});

  @override
  State<DiscoverElementDetails> createState() => _DiscoverElementDetailsState();
}

class _DiscoverElementDetailsState extends State<DiscoverElementDetails> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) {
                        return widget.images[index];
                      },
                    ),
                  ),
                  SafeArea(
                    top: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          fillColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.all(10.0),
                          shape: const CircleBorder(),
                          child: const Center(
                              child: Icon(
                            Icons.arrow_back,
                          )),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Shared with others!')));
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10),
                                    primary: Colors.white),
                                child: const Icon(
                                  Icons.outbox_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget.isFav = !widget.isFav;
                                    data.toggleFav(widget.id);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10),
                                    primary: Colors.white),
                                child: Icon(
                                  widget.isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Text(
                    '${widget.name} and some more information that are not contain in this project :)',
                    style: TextStyle(fontSize: 30),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      Text(widget.opinion.toString())
                    ],
                  )),
              Divider(),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      Center(
                          child:
                              Text('Aditional info, it is just clone app :)')),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.price.toString()}\$ night',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('06 Nov'),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      title: Text('Confirmation'),
                      content: Text('Do you realy want to book this room?'),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 248, 248, 248),
                                onPrimary: Colors.black),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('NO')),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.pink),
                            onPressed: () {
                              data.addTrip(widget.id);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('YES')),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.pink, padding: EdgeInsets.all(15)),
                child: Text('BOOK NOW'))
          ],
        ),
      ),
    );
  }
}
