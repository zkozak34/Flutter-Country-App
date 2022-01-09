import 'package:countryappv2/controllers/country_controller.dart';
import 'package:countryappv2/models/country.dart';
import 'package:countryappv2/views/country_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryCard extends StatelessWidget {
  CountryCard({Key? key, required this.country, required this.index}) : super(key: key);
  final Country country;
  final CountryController controller = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColorLight,
          child: CircleAvatar(
            backgroundImage: NetworkImage(country.flags.png.toString()),
          ),
        ),
        title: Text(country.name.toString()),
        subtitle: Text(country.capital.toString()),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                controller.favoriteCountry(index);
              },
              icon: Icon(
                Icons.favorite,
                color: country.favorite.value ? Colors.red : Colors.grey,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.to(CountryView(country: country));
                },
                icon: const Icon(Icons.read_more)),
          ],
        ),
      ),
    );
  }
}
