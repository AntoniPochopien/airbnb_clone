import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_provider.dart';
import '../widgets/discover_element.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 100,
        ),
        Container(
          child: Text(
            'Listy życzeń',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        data.wishList.isEmpty
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Stwórz swoją pierwszą listę życzeń',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Wyszykując wyniki, klikaj serduszko, by miejsca lub atrakcje, które najbardziej Ci się podobają, zapisać na liście życzeń.',
                  style: TextStyle(color: Colors.grey),
                )
              ])
            : Expanded(
                child: ListView.builder(
                    itemCount: data.wishList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Container(
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
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              data.wishList[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
      ]),
    );
  }
}
