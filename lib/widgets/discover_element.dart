import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';
import '../screens/Discover_element_details.dart';

class DiscoverElement extends StatefulWidget {
  int id;
  String name;
  double opinion;
  double price;
  List<Image> images;
  bool isFav;

  DiscoverElement(
      {required this.id,
      required this.name,
      required this.opinion,
      required this.price,
      required this.images,
      required this.isFav});

  @override
  State<DiscoverElement> createState() => _DiscoverElementState();
}

class _DiscoverElementState extends State<DiscoverElement> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiscoverElementDetails(
                id: widget.id,
                name: widget.name,
                opinion: widget.opinion,
                price: widget.price,
                images: widget.images,
                isFav: widget.isFav),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: PageView.builder(
                        itemCount: widget.images.length,
                        itemBuilder: (context, index) {
                          return widget.images[index];
                        },
                      )),
                ),
                Positioned(
                  top: 0,
                  left: 275,
                  right: 0,
                  bottom: 225,
                  child: IconButton(
                      onPressed: () {
                        widget.isFav = !widget.isFav;
                        data.toggleFav(widget.id);
                      },
                      icon: widget.isFav
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            )),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.black,
                      size: 18,
                    ),
                    Text(widget.opinion.toString())
                  ],
                ),
              ],
            ),
            Text(
              'Gospodarz profesjonalny',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '22-29 paź',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text('${widget.price} noc'),
          ],
        ),
      ),
    );
  }
}
