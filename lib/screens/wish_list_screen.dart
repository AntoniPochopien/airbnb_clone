import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';
import '../screens/Discover_element_details.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return SafeArea(
      top: true,
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Wish List',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
            ]),
          ),
          data.wishList.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Create your first wish list',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'When searching for results, click on the heart to save the places or attractions you like best to your wishlist.',
                        style: TextStyle(color: Colors.grey),
                      )
                    ])
              : Expanded(
                  child: ListView.builder(
                      itemCount: data.wishList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiscoverElementDetails(
                                    id: data.bookedTrips[index].id,
                                    name: data.bookedTrips[index].name,
                                    opinion: data.bookedTrips[index].opinion,
                                    price: data.bookedTrips[index].price,
                                    images: data.bookedTrips[index].images,
                                    isFav: data.bookedTrips[index].isFav),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Card(
                                    elevation: 7,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: data.wishList[index].images[0],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  data.wishList[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
        ]),
      ),
    );
  }
}
