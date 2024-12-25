import 'package:introvertdiaries/src/core/core.dart';

class ThankYouComponentPage extends StatelessWidget {
  const ThankYouComponentPage({
    required this.title, required this.subTitle, required this.imagePath, required this.buttonText, required this.callback, super.key,
  });
  final String title;
  final String subTitle;
  final String imagePath;
  final String buttonText;
  final void Function() callback;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.verticalSpace,
            // SizedBox(
            //   height: 200,
            //   child: AppCacheImageViewer(
            //     imageUrl: Assets.gif.thankYou.path,
            //     imageTypeEnum: ImageTypeEnum.assets,
            //   ),
            // ),
            40.verticalSpace,
            Text(
              title,
              style: AppTextStyles.text18PxSemiBold,
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            Text(
              subTitle,
              style: AppTextStyles.text14Px.textTileGrey,
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            CustomOutlinedButton(
              label: buttonText,
              textColor: AppColors.black,
              labelStyle: AppTextStyles.text14PxSemiBold,
              borderColor: AppColors.tileGrey,
              isDisabled: false,
              fullWidth: true,
              height: 40,
              onPressed: callback,
            ),
          ],
        ),
      ),
    );
  }
}
