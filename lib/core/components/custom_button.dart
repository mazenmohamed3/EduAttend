import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String? title;
  final double? verticalMargin, horizontalMargin, height, width;
  final bool noAction;
  final bool isLoading;
  final Color? color;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.title,
    this.noAction = true,
    this.isLoading = false,
    this.verticalMargin,
    this.height,
    this.width,
    this.color,
    this.horizontalMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin ?? 0,
        horizontal: horizontalMargin ?? 0,
      ),
      child: ElevatedButton(
        onPressed: (noAction && !isLoading) ? () => onPressed() : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? (noAction ? Colors.blue : Colors.grey),
          disabledBackgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5.r),
          ),
          padding: EdgeInsets.zero,
        ),
        child: isLoading
            ? Transform.scale(
          scale: 0.8,
          child: const CircularProgressIndicator(
            color: Colors.black,
          ),
        )
            : CustomText(
          text: title ?? 'Continue'.tr(),
          fontSize: 16.sp,
          color: noAction ? Colors.white : Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}