import 'package:get/get.dart';

class Country {
  String? name;
  String? capital;
  String? region;
  Flags flags;
  String? flag;
  RxBool favorite;

  Country({this.name, this.capital, this.region, required this.flags, this.flag, required this.favorite});

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
        name: json['name'],
        capital: json['capital'],
        region: json['region'],
        flags: Flags.fromJSON(json['flags']),
        flag: json['flag'],
        favorite: false.obs);
  }
}

class Flags {
  String? svg;
  String? png;

  Flags({this.svg, this.png});

  factory Flags.fromJSON(Map json) {
    return Flags(svg: json['svg'], png: json['png']);
  }
}
