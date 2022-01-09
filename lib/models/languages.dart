import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'Learn Country',
          'appbar_country': 'Countries',
          'appbar_favorite': 'Favorities',
          'loading_snackbar_title': 'Learn Country',
          'loading_snackbar_message': 'Country list updated.',
          'search_input_text': 'Search country ...'
        },
        'tr_TR': {
          'app_title': 'Ülke Öğren',
          'appbar_country': 'Ülkeler',
          'appbar_favorite': 'Favoriler',
          'loading_snackbar_title': 'Ülke Öğren',
          'loading_snackbar_message': 'Ülke listesi güncellendi.',
          'search_input_text': 'Ülke ara ...'
        }
      };
}
