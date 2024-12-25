import 'package:introvertdiaries/src/core/components/components.dart';
import 'package:introvertdiaries/src/core/enum/enum.dart';
import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessComponent extends StatelessWidget {
  const SuccessComponent({
    required this.callback, required this.title, required this.subTitle, required this.label, super.key,
    this.isPinChange = false,
  });

  final void Function() callback;
  final String title;
  final String subTitle;
  final String label;
  final bool isPinChange;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              width: 180,
              child: AppCacheImageViewer(
                imageUrl:
                    'https://s3-alpha-sig.figma.com/img/ce9c/b6ce/7d1ffc802e079977cf054e71b24fa36d?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oEH-2yB0Xy8j~XK9kTE~uivZivqwYHZ1RwaJ7rTxLtPB-cVt3OSHAv23lHctDtGewdm-SFIK-2pmBK7jkFEDdhAbTOU8q8wvRLBfR-~tLtK1Fn5oWKcdGJgPxKFfk~snaRZTd1uXNvO82Ku8ijg8hFZsU5JAVLIXqf3T0VetVnjgaTIYE5wY981M6FJppVOOgRg3~bUiNFZ-Eq-m385zTsVouH4gt4QTMNQRqrK7tG6xdELOHpvQBotrIwkNoW1~rZHaKdQsFVXK6LUKRI3NIeK6CNeAuFhlFwyzgacvF~p4RASIst-Q4rsDowb60Y~SftdE8Mz5sf4ySiEHwi7yBw__',
                imageTypeEnum: ImageTypeEnum.network,
              ),
            ),
            30.verticalSpace,
            TitleSubtitle(
              textAlign: TextAlign.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              title: title,
              subTitle: subTitle,
              titleStyle: AppTextStyles.text18PxBold,
              subtitleStyle: AppTextStyles.text13Px.textGrey,
            ),
            40.verticalSpace,
            if (isPinChange) CustomButton(
                    label: label,
                    onPressed: callback,
                    isDisabled: false,
                    fullWidth: true,
                  ) else CustomOutlinedButton(
                    height: 38,
                    label: label,
                    textColor: AppColors.black,
                    labelStyle: AppTextStyles.text14PxBold,
                    onPressed: callback,
                    isDisabled: false,
                    fullWidth: true,
                  ).px(15),
          ],
        ),
      ),
    );
  }
}
