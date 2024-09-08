import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final String? initialValue;
  final Function(String) onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onSaved;
  final TextInputType textInputType;
  final bool readOnly;
  final bool isEnabled;
  final String labelText;
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
  final Color? borderColor;
  final Color fillColor;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final bool isEditIcon;
  final void Function()? onEditTap;
  final String hintText;
  final List<TextInputFormatter>? inputFormatter;

  const CustomInputField({
    super.key,
    required this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.initialValue,
    required this.textInputType,
    this.readOnly = false,
    this.isEnabled = true,
    this.labelText = '',
    required this.validator,
    this.textController,
    this.obscureText = false,
    this.isViewButtonRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.isCounttextRequired = false,
    this.isAutoValidteRequired = false,
    this.isSuffixIcon,
    this.suffixText,
    this.prefixIcon,
    this.onTap,
    this.isEditIcon = false,
    this.onEditTap,
    this.inputFormatter,
    required this.fillColor,
    this.hintText = '',
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        fillColor: fillColor,

        hintText: hintText.isNotEmpty ? hintText : null,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.black.withOpacity(0.4),
        ),
        filled: true,
        errorMaxLines: 1,
        // errorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: AppColor.errorRed),
        //   borderRadius: BorderRadius.circular(6),
        // ),
        suffixIcon: isSuffixIcon,
        labelText: hintText.isNotEmpty ? null : labelText,
        labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: borderColor ?? Colors.black.withOpacity(0.1),
          ),
        ),
        focusedBorder: InputBorder.none,

        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: borderColor ?? Colors.black.withOpacity(0.1),
            )),
        errorStyle:
            const TextStyle(fontSize: 12, color: Colors.red, height: 0.5),
      ),
    );
  }
}


// TextFormField(
//               decoration: InputDecoration(
//                   fillColor: AppColors.textFieldColor,
//                   filled: true,
//                   label: Text(
//                     "Username or email",
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
//                   ),
//                   prefixIcon: Icon(Icons.person_2_sharp,
//                       size: 24, color: AppColors.darkGrey),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12))),
//             ),