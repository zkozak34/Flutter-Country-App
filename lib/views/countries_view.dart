import 'package:countryappv2/components/countrycard.dart';
import 'package:countryappv2/controllers/country_controller.dart';
import 'package:countryappv2/models/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountryController _controller = Get.put(CountryController());
    List<Country> countries = _controller.countries;
    TextEditingController t1 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('appbar_country'.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(Icons.wb_sunny),
          ),
          IconButton(
              onPressed: () {
                Get.locale == const Locale('tr', 'TR')
                    ? Get.updateLocale(const Locale('en', 'US'))
                    : Get.updateLocale(const Locale('tr', 'TR'));
              },
              icon: const Icon(Icons.language))
        ],
      ),
      body: Obx(
        () => countries.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'search_input_text'.tr,
                      ),
                      controller: t1,
                      onChanged: (t) {
                        _controller.searchCountry(t);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) => CountryCard(
                        country: countries[index],
                        index: index,
                      ),
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.refreshCountryList();
          t1.clear();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
