import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_asset.dart';
import '../../../core/constants/app_theme/custom_color_scheme.dart';
import '../custom_button.dart';
import '../custom_svg.dart';

class ActionCompleted extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final double? assetSize;
  final String? asset;
  final String? buttonText;
  final Widget? cta;
  final bool showAsset;
  const ActionCompleted({
    super.key,
    this.buttonText,
    this.asset,
    this.assetSize,
    this.cta,
    this.showAsset = true,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          if (showAsset)
            CustomAssetViewer(
              asset: asset ?? AppAsset.success,
              useColorFilter: false,
              height: assetSize?.h ?? 120.h,
              width: assetSize?.w ?? 120.w,
            ),
          //     Clickable(
          //       onPressed: () {
          //         popNavigation(context: context);
          //       },
          //       child: Icon(Icons.close, color: ColorPath.osloGray, size: 16.w),
          //     ),
          //   ],
          // ),
          SizedBox(height: 16.h),
          FittedBox(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.textPrimary,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          if (cta == null)
            CustomButton(
              buttonText: buttonText ?? 'Close',
              onPressed: onPressed,
            )
          else
            cta!,
        ],
      ),
    );
  }
}
