import 'package:introvertdiaries/src/core/core.dart';

class ImageDownloadComponent extends StatelessWidget {
  const ImageDownloadComponent({required this.image, super.key});

  final String image;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackWidget(),
        backgroundColor: AppColors.black,
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     ImageDownloader().downloadImage(image);
          //   },
          //   child: Assets.svg.dowload.svg(
          //     colorFilter: const ColorFilter.mode(
          //       AppColors.white,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          // ),
          20.horizontalSpace,
        ],
      ),
      body: Container(
        height: context.height,
        color: AppColors.black,
        child: SizedBox(
          height: 200,
          child: AppCacheImageViewer(
            imageUrl: image,
            imageTypeEnum: ImageTypeEnum.network,
          ),
        ),
      ),
    );
  }
}
