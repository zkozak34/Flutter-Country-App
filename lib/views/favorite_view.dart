import 'package:countryappv2/components/countrycard.dart';
import 'package:countryappv2/controllers/country_controller.dart';
import 'package:countryappv2/models/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountryController _controller = Get.find();
    List<Country> countries = _controller.favoriteCountries;

    return Scaffold(
      appBar: AppBar(
        title: Text('appbar_favorite'.tr),
      ),
      body: countries.isNotEmpty
          ? ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) => CountryCard(
                country: countries[index],
                index: index,
              ),
            )
          : const Center(child: Text("Favoriniz bulunmamaktadır.")),
    );
  }
}
