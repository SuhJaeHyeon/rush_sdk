
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/widget/svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool autofocus;
  final String title;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String hintText;
  final String helperText;
  final List<String>? autofillHints;
  final Function(String)? onChanged;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextStyle? style;

  const CustomTextField({
    Key? key,
    this.controller,
    this.autofocus = false,
    this.title = '',
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.prefix,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.hintText = '',
    this.helperText = '',
    this.onChanged,
    this.autofillHints,
    this.inputFormatters,
    this.readOnly = false,
    this.obscureText = false,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: AppTextStyle.text15.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        TextField(
          obscureText: obscureText,
          readOnly: readOnly,
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onChanged,
          cursorColor: AppColors.primaryBlack,
          inputFormatters: inputFormatters,
          controller: controller,
          autofillHints: autofillHints,
          maxLength: maxLength,
          keyboardType: keyboardType,
          style: style ??
              AppTextStyle.text15.copyWith(
                fontWeight: FontWeight.w500,
              ),
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: AppTextStyle.text15.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.grey07,
            ),
            helperText: helperText,
            helperStyle: AppTextStyle.text12.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.grey10,
            ),
            // contentPadding: EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryBlack),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey07),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey07),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.error),
            ),
            suffix: suffix,
            suffixIcon: suffixIcon,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 25,
              maxWidth: 25,
              minHeight: 25,
              minWidth: 25,
            ),
            prefix: prefix,
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              maxHeight: 25,
              maxWidth: 25,
              minHeight: 25,
              minWidth: 25,
            ),
          ),
          autofocus: autofocus,
        ),
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;
  final int? maxLength;
  final Iterable<String>? autofillHints;
  final String? hintText;
  final String? helperText;
  final bool autofocus;

  const SearchTextField({
    Key? key,
    this.onChanged,
    required this.controller,
    this.maxLength,
    this.autofillHints,
    this.hintText,
    this.helperText,
    required this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.primaryBlack,
      controller: controller,
      autofillHints: autofillHints,
      maxLength: maxLength,
      style: AppTextStyle.text15,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        filled: true,
        fillColor: AppColors.grey04,
        hintStyle: AppTextStyle.text15.copyWith(
          color: AppColors.grey10,
        ),
        helperText: helperText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(0),
        ),
        prefixIcon: SvgPicture.asset('assets/icon/search.svg'),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 24,
          maxWidth: 50,
          minHeight: 24,
          minWidth: 50,
        ),
      ),
      autofocus: autofocus,
    );
  }
}

class StoreSearchTextField extends StatelessWidget {
  const StoreSearchTextField({
    super.key,
    this.onChanged,
    required this.controller,
    this.enabled,
    this.onDelete,
    this.onEditingComplete,
  });

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? enabled;
  final void Function()? onDelete;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryBlack,
      controller: controller,
      maxLines: 1,
      style: AppTextStyle.text14.copyWith(
        fontWeight: FontWeight.w500,
      ),
      enabled: enabled ?? true,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        counterText: '',
        hintText: '찾는 모델을 검색해주세요',
        filled: true,
        fillColor: AppColors.grey04,
        hintStyle: AppTextStyle.text14.copyWith(
          color: AppColors.grey10,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(2),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey04),
          borderRadius: BorderRadius.circular(2),
        ),
        prefixIcon: SVGAsset(
          'assets/icon/search.svg',
          size: 20,
          color: AppColors.grey08,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          maxWidth: 36,
          minHeight: 20,
          minWidth: 36,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 20,
          maxWidth: 36,
          minHeight: 20,
          minWidth: 36,
        ),
        suffixIcon: (onDelete == null || controller!.text.isEmpty)
            ? null
            : GestureDetector(
                onTap: onDelete,
                child: SVGAsset(
                  'assets/icon/text_clear.svg',
                  size: 18,
                ),
              ),
      ),
    );
  }
}
