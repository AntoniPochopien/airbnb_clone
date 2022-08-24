import 'package:flutter/material.dart';

import '../models/elemen_model.dart';

class DataProvider with ChangeNotifier {
  List<ElementModel> elements = [
    ElementModel(
        id: 1,
        name: 'Badachro, Great Britain',
        opinion: 4.78,
        price: 750,
        isFav: false,
        images: <Image>[
          Image.network(
            'https://cdn.galleries.smcloud.net/t/galleries/gf-VDNQ-eM3p-xTjV_lato-kalendarz-wakacje-664x442-nocrop.jpg',
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://static1.eskypartners.com/travelguide/co-to-sa-wakacje-last-minute.jpg',
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://wakacyjnapolisa.pl/wp-content/uploads/2015/05/youth-570881-1024x682.jpg',
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://bi.im-g.pl/im/ef/5b/1a/z27637231IH,Cancun.jpg',
            fit: BoxFit.fill,
          ),
        ]),
    ElementModel(
        id: 2,
        name: 'Jasna Góra, Częstochowa',
        opinion: 3.8,
        price: 230,
        isFav: false,
        images: <Image>[
          Image.network(
            'https://polskazachwyca.pl/wp-content/uploads/2019/03/Cz%C4%99stochowa-Jasna-G%C3%B3ra-z-drona-shutterstock_1219510213-696x464.jpg',
            fit: BoxFit.fill,
          ),
          Image.network(
            'https://ipla.pluscdn.pl/dituel/cp/fg/fgecn1ig4wdu45vq1z852qsqt81tw939.jpg',
            fit: BoxFit.fill,
          ),
        ])
  ];
  List<Tab> tabsList = [
    const Tab(
        icon: Icon(
          Icons.wb_sunny_outlined,
        ),
        child: Text(
          'Beach',
        )),
    const Tab(
        icon: Icon(
          Icons.account_balance_wallet_outlined,
        ),
        child: Text(
          'Budgetary',
        )),
    const Tab(
        icon: Icon(Icons.photo_camera_back_outlined),
        child: Text(
          'Beautiful',
        )),
    const Tab(
        icon: Icon(Icons.apartment_outlined),
        child: Text(
          'Modern',
        )),
    const Tab(
        icon: Icon(
          Icons.assessment_outlined,
        ),
        child: Text(
          'The best reviews',
        )),
    const Tab(
        icon: Icon(
          Icons.brightness_3,
        ),
        child: Text(
          'Night life',
        )),
  ];

  List<ElementModel> wishList = [];
  List<ElementModel> bookedTrips = [];

  void toggleFav(objectId) {
    final index = elements.indexWhere((element) => element.id == objectId);
    elements[index].isFav = !elements[index].isFav;
    if (elements[index].isFav) {
      wishList.add(elements[index]);
    } else {
      wishList.remove(elements[index]);
    }

    notifyListeners();
  }

  void addTrip(objectId) {
    final index = elements.indexWhere((element) => element.id == objectId);
    if (bookedTrips.contains(elements[index])) {
      return;
    }
    bookedTrips.add(elements[index]);
    notifyListeners();
  }
}
