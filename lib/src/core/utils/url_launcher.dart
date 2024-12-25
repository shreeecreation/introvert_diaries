import 'package:url_launcher/url_launcher.dart' as ul;

final class UrlLauncher {
  const UrlLauncher._();

  static Future<void> call(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);

    if (await ul.canLaunchUrl(uri)) await ul.launchUrl(uri);
  }

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await ul.canLaunchUrl(uri)) await ul.launchUrl(uri, mode: ul.LaunchMode.inAppBrowserView);
  }

  static Future<void> openZoom({String? code, String? passcode}) async {
    const baseUrl = 'zoomus://zoom.us/join';
    const webUrl = 'https://zoom.us/join';

    final zoomUrl = code == null
        ? Uri.parse(baseUrl)
        : Uri.parse('$baseUrl?confno=$code${passcode != null ? '&pwd=$passcode' : ''}');

    if (await ul.canLaunchUrl(zoomUrl)) {
      await ul.launchUrl(zoomUrl);
    } else {
      final url =
          code == null ? webUrl : '$webUrl?confno=$code${passcode != null ? '&pwd=$passcode' : ''}';
      return openUrl(url);
    }
  }
}
