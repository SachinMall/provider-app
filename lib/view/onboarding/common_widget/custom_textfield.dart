import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? initialValue;
  final Function(String) onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onSaved;
  final TextInputType textInputType;
  final bool readOnly;
  final bool isEnabled;
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController? textController;
  final bool obscureText;
  final bool isViewButtonRequired;
  final int? maxLength;
  final int maxLines;
  final bool isCounttextRequired;
  final bool isAutoValidteRequired;
  final Widget? isSuffixIcon;
  final String? suffixText;
  final Color fillColor;
  final void Function()? onTap;
  final TextStyle? hintstyle;
  final Widget? prefixIcon;
  final bool isEditIcon;
  final void Function()? onEditTap;
  final List<TextInputFormatter>? inputFormatter;
  final bool isStyle;

  const CustomInputField({
    super.key,
    required this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.initialValue,
    required this.title,
    required this.textInputType,
    this.readOnly = false,
    this.isEnabled = true,
    this.hintText = '',
    required this.validator,
    this.textController,
    this.obscureText = false,
    this.isViewButtonRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.subtitle = "",
    this.isCounttextRequired = false,
    this.isAutoValidteRequired = false,
    this.isSuffixIcon,
    this.suffixText,
    this.prefixIcon,
    this.onTap,
    this.hintstyle,
    this.isEditIcon = false,
    this.onEditTap,
    this.inputFormatter,
    this.isStyle = false,
    required this.fillColor,
  });

  // late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title == ""
        //     ? const SizedBox()
        //     : Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(title, style: body2TextRegular),
        //           isEditIcon
        //               ? GestureDetector(
        //                   onTap: onEditTap,
        //                   child: SvgPicture.asset(IconAssets.editIcon))
        //               : const SizedBox(),
        //         ],
        //       ),
        subtitle == "" ? const SizedBox() : Text(subtitle),
        Gap(10),
        TextFormField(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: textController,
          obscureText: obscureText,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,
          readOnly: readOnly,
          onTap: onTap,
          onFieldSubmitted: onSubmit,
          onChanged: (newvalue) {
            onChanged(newvalue);
            if (isAutoValidteRequired) {
              if (newvalue != "") {
                Form.of(context).validate();
              }
            }
          },
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            counterText: isCounttextRequired ? null : "",
            fillColor: fillColor,
            filled: true,
            errorMaxLines: 1,
            // errorBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(color: AppColor.errorRed),
            //   borderRadius: BorderRadius.circular(6),
            // ),
            suffixIcon: isSuffixIcon,
            hintText: hintText,
            hintStyle: hintstyle,

            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            errorStyle:
                const TextStyle(fontSize: 12, color: Colors.red, height: 0.5),
          ),
        ),
      ],
    );
  }
}
