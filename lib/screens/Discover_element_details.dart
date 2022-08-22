import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
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
                        child: Center(
                            child: Icon(
                          Icons.arrow_back,
                        )),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Udostępniono')));
                              },
                              child: Icon(
                                Icons.outbox_outlined,
                                color: Colors.black,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                  primary: Colors.white),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                widget.isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.black,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                  primary: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text(widget.name),
            Text(widget.opinion.toString()),
            Text(widget.price.toString()),
          ],
        ),
      ),
    );
  }
}
