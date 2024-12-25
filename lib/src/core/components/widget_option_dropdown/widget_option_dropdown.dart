import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';


class WidgetOptionDropdown extends StatelessWidget {
  WidgetOptionDropdown({super.key});
  final GlobalKey _popupMenuButtonKey = GlobalKey();


  void _openPopupMenu(BuildContext context) {
    final button = _popupMenuButtonKey.currentContext!.findRenderObject()! as RenderBox;
    final offset = button.localToGlobal(Offset(20, button.size.height - 20));
    final overlay = Overlay.of(context).context.findRenderObject()! as RenderBox;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(offset, offset.translate(1, 1)),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      constraints: const BoxConstraints(minWidth: 210),
      context: context,
      position: position,
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: 10.rounded),
      surfaceTintColor: AppColors.white,
      color: AppColors.white,
      items: [
        // customPopupMenuItem(
        //     leading: const Icon(Icons.remove_red_eye_outlined),
        //     title: Text(
        //       'View',
        //       style: AppTextStyles.text14PxBold,
        //     ),
        //     shape: _border,
        //     onTap: () {
        //       Navigator.pop(context);
        //       // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       //   return ImageDownloadComponent(image: Assets.images.bill.path);
        //       // }));
        //     }),
        // customPopupMenuItem(
        //   leading: Assets.svg.dowload.svg(height: 18, colorFilter: SvgColorFilterHelper().colorFilterSrc(AppColors.black)),
        //   title: Text(
        //     'Download',
        //     style: AppTextStyles.text14PxBold,
        //   ),
        //   shape: _border,
        // ),
        // customPopupMenuItem(
        //   leading: Assets.svg.edit.svg(
        //     height: 18,
        //   ),
        //   title: Text(
        //     'Edit',
        //     style: AppTextStyles.text14PxBold,
        //   ),
        //   shape: _border,
        // ),
        // customPopupMenuItem(
        //   onTap: () {
        //     Navigator.pop(context);
        //     CustomDialogBox.show(
        //         onSecondButtonPressed: () {},
        //         context: context,
        //         title: "Are you sure you want to delete this notice? This action cannot be undone.",
        //         imagePath: Assets.svg.delete.path,
        //         buttonColor: AppColors.statusRed,
        //         secondButtonTitle: "Delete");
        //   },
        //   leading: Assets.svg.delete.svg(),
        //   title: Text(
        //     'Delete',
        //     style: AppTextStyles.text14PxBold.red,
        //   ),
        // ),
      ],
    ).then((value) {
      if (value != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        onPressed: () {
          _openPopupMenu(context);
        },
        icon: const Icon(
          Icons.more_vert_sharp,
          size: 22,
        ),
        key: _popupMenuButtonKey,
      ),
    );
  }
}

PopupMenuItem<String> customPopupMenuItem({
  required Widget leading,
  required Widget title,
  VoidCallback? onTap,
  ShapeBorder? shape,
}) {
  return PopupMenuItem<String>(
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: title,
      onTap: onTap,
      shape: shape,
      leading: leading,
    ).pOnly(left: 10),
  );
}
