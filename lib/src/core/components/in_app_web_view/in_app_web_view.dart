import 'package:introvertdiaries/src/core/core.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebViewer extends StatefulWidget {
  const AppWebViewer({required this.url, super.key});

  final String url;

  static const String path = '/web-viewer';

  @override
  State<AppWebViewer> createState() => _AppWebViewerState();
}

class _AppWebViewerState extends State<AppWebViewer> {
  final _isLoading = ValueNotifier<bool>(true);
  final _webTitle = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<String?>(
              valueListenable: _webTitle,
              builder: (context, webTitle, child) {
                if (webTitle == null) {
                  return const SizedBox();
                } else {
                  return Text(
                    webTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  );
                }
              },
            ),
            Text(
              widget.url,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: ValueListenableBuilder<bool>(
            valueListenable: _isLoading,
            builder: (context, isLoading, child) {
              return isLoading
                  ? const LinearProgressIndicator(
                      minHeight: 3,
                      color: AppColors.primaryColor,
                    )
                  : const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.greyColor,
                    );
            },
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            _isLoading.value = false;
          }
        },
        onLoadStart: (controller, url) async {
          final doc = await controller.getHtml();
          // find title
          if (doc != null) {
            final title = doc.split('<title>')[1].split('</title>')[0].replaceAll('\n', '');
            _webTitle.value = title;
          }
        },
      ),
    );
  }
}
