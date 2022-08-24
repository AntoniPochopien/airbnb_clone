import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';
import '../screens/Discover_element_details.dart';
import '../screens/main_page.dart';

class TripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);

    return SafeArea(
        top: true,
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Trips',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                    ]),
              ),
              data.bookedTrips.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'You have not booked any trips yet',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Time to get your suitcases out and plan your next adventure',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => MainPage(),
                                //     ));
                              },
                              child: Text(
                                'Find a place to stay',
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        Divider(),
                        Text(
                          'Don\'t see your booking here? Visit the Help Center',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: data.bookedTrips.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DiscoverElementDetails(
                                            id: data.bookedTrips[index].id,
                                            name: data.bookedTrips[index].name,
                                            opinion:
                                                data.bookedTrips[index].opinion,
                                            price:
                                                data.bookedTrips[index].price,
                                            images:
                                                data.bookedTrips[index].images,
                                            isFav:
                                                data.bookedTrips[index].isFav),
                                  ),
                                );
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Card(
                                        elevation: 7,
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child:
                                            data.bookedTrips[index].images[0],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      data.bookedTrips[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ));
  }
}
