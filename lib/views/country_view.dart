import 'package:countryappv2/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryView extends StatelessWidget {
  const CountryView({Key? key, required this.country}) : super(key: key);
  final Country country;
  @override
  Widget build(BuildContext context) {
    String imgUrl = country.flag.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(country.name.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(flex: 1, child: SvgPicture.network(imgUrl)),
          Flexible(
            flex: 2,
            child: Text(
              country.name.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.headline4?.fontSize),
            ),
          ),
          Text(
            country.capital.toString(),
            style: TextStyle(fontSize: Theme.of(context).textTheme.headline5?.fontSize),
          )
        ],
      ),
    );
  }
}
