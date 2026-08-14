import 'package:flutter/material.dart';
import 'package:internet_intranet/ui/widgets/custom_container.dart';
import '../../core/constants/color_path.dart';

class CustomRadioButton extends StatelessWidget {
  final bool value;
  const CustomRadioButton({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 20,
      width: 20,
      shape: BoxShape.circle,
      bgColor: Colors.white,
      border: Border.all(
        color: value ? ColorPath.brandColor : ColorPath.mischkaGrey,
      ),
      child: value
          ? Icon(Icons.circle, size: 8, color: ColorPath.brandColor)
          : SizedBox.shrink(),
    );
  }
}
