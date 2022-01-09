import 'package:countryappv2/models/country.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryController extends GetxController {
  final _countries = <Country>[].obs;
  final _countriesBackup = <Country>[];

  @override
  void onInit() {
    super.onInit();
    getCountry();
  }

  getCountry() async {
    var url = Uri.parse("https://restcountries.com/v2/all");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var countryJSON = jsonDecode(response.body);
        for (var country in countryJSON) {
          _countries.add(Country.fromJSON(country));
          _countriesBackup.add(Country.fromJSON(country));
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  List<Country> get countries => _countries;

  favoriteCountry(int index) {
    _countries[index].favorite.value = !_countries[index].favorite.value;
    update();
  }

  List<Country> get favoriteCountries => _countries.where((p0) => p0.favorite.value).toList();

  refreshCountryList() async {
    _countries.clear();
    _countriesBackup.clear();
    await getCountry();
    Get.snackbar("loading_snackbar_title".tr, "loading_snackbar_message".tr);
  }

  searchCountry(String t) {
    var filtercountries = _countriesBackup.where((p0) => p0.name!.toLowerCase().contains(t)).toList();
    t.isNotEmpty && filtercountries.isNotEmpty
        ? _countries.value = filtercountries
        : _countries.value = _countriesBackup;
  }
}
