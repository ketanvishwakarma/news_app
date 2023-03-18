import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> launchWebsite(String url) async {
  try {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } on Exception {
    log('Can not to launch url');
  }
}
