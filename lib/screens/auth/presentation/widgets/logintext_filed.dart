
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  final bool showSuffixIcon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,

    this.showSuffixIcon = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }
  OutlineInputBorder _greyBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide:  BorderSide(color: AppColors.colEdF1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: mediumTextStyle(fontSize: dimen12.sp, color: AppColors.colBlack),
      decoration: InputDecoration(

        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: () => setState(() => _obscureText = !_obscureText),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              _obscureText?Assets.svg.loginEyesOff:Assets.svg.logEyesOn,
              height: 12.h,
              fit: BoxFit.contain,

            ),
          ),
        )
            : null,
        enabledBorder: _greyBorder(),
        focusedBorder: _greyBorder(),
        errorBorder: _greyBorder(),
        focusedErrorBorder: _greyBorder(),
        border: _greyBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
