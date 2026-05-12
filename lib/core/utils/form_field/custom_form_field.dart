// import 'package:flutter/material.dart';
// import 'package:nowor_app/core/constants/app_colors.dart';
// import 'package:nowor_app/core/utils/responsive/screen.dart';
// import 'package:nowor_app/core/utils/responsive/sized_box.dart';
// import 'package:nowor_app/core/utils/text/custom_text.dart';

// class CustomFormField extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? title;
//   final String? hintText;
//   final double? padding;
//   final double? horPadding;
//   final bool isPassword;
//   final dynamic backgroundColor;
//   final Widget? suffixIcon;
//   final int? minLine;
//   final int? maxLine;
//   final VoidCallback? onTap;
//   final bool readOnly;
//   final String? initialValue;
//   final Widget? prefixIcon;
//   final bool? isValidator;
//   final bool? isPhone;
//   final bool? isMail;
//   final bool? isRequired;
//   final Color? titleColor;
//   final double? radius;
//   final Color? borderColor;
//   final double? hindTextSize;
//   final ValueChanged<String>? onChange;
//   const CustomFormField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.isPassword = false,
//     this.backgroundColor,
//     this.suffixIcon,
//     this.minLine,
//     this.maxLine,
//     this.onTap,
//     this.readOnly = false,
//     this.prefixIcon,
//     this.padding,
//     this.onChange,
//     this.initialValue,
//     this.isValidator,
//     this.isPhone,
//     this.isMail,
//     this.title,
//     this.isRequired,
//     this.horPadding,
//     this.titleColor,
//     this.radius,
//     this.borderColor,
//     this.hindTextSize,
//   });

//   @override
//   State<CustomFormField> createState() => _CustomFormField();
// }

// class _CustomFormField extends State<CustomFormField> {
//   bool obSecure = true;

//   @override
//   Widget build(BuildContext context) {
//     double width = Screen.screenWidth(context);
//     double scaleFactor = width / Screen.designWidth;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.title != null) ...[
//           CustomText(
//             text: widget.title!,
//             color: widget.titleColor ?? AppColors.pearlBlack,
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             isComic: true,
//           ),
//           Sh(h: 0.01),
//         ],

//         TextFormField(
//           keyboardType: widget.isPhone == true
//               ? TextInputType.phone
//               : widget.isMail == true
//               ? TextInputType.emailAddress
//               : null,
//           initialValue: widget.initialValue,
//           cursorColor: AppColors.pearlBlack,
//           onChanged: widget.onChange,
//           onTap: widget.onTap,
//           controller: widget.controller,
//           readOnly: widget.readOnly,
//           minLines: widget.minLine ?? 1,
//           maxLines: widget.maxLine ?? 1,
//           validator: widget.isValidator == false
//               ? null
//               : widget.isMail == true
//               ? (value) {
//                   if (value?.trim().isEmpty ?? true) {
//                     return '${widget.title} can not be empty';
//                   } else if (RegExp(
//                     r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.(com|net|org)$',
//                   ).hasMatch(value!)) {
//                     return null;
//                   }
//                   return "Please enter valid e-mail";
//                 }
//               : (value) {
//                   if (value!.isEmpty) {
//                     return '${widget.title} can not be empty';
//                   }
//                   return null;
//                 },
//           style: TextStyle(
//             fontFamily: 'comingSoon',
//             fontSize: 13,
//             fontWeight: .w500,
//             color: AppColors.pearlBlack,
//           ),

//           obscureText: widget.isPassword && obSecure,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: (widget.backgroundColor == null)
//                 ? AppColors.transparent
//                 : widget.backgroundColor,
//             contentPadding: EdgeInsets.symmetric(
//               vertical: widget.padding ?? 0,
//               horizontal: widget.horPadding ?? scaleFactor * 20,
//             ),
//             prefixIcon: widget.prefixIcon,
//             suffixIcon: widget.isPassword
//                 ? GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         obSecure = !obSecure;
//                       });
//                     },
//                     child: Icon(
//                       (widget.isPassword && obSecure)
//                           ? Icons.visibility_off_outlined
//                           : Icons.visibility_outlined,
//                       size: scaleFactor * 20,
//                       color: AppColors.heatherGrey,
//                     ),
//                   )
//                 : widget.suffixIcon,
//             hintText: widget.hintText,
//             hintStyle: TextStyle(
//               fontFamily: 'comingSoon',
//               fontSize: widget.hindTextSize ?? 13,
//               fontWeight: .w400,
//               color: AppColors.heatherGrey,
//             ),

//             errorStyle: TextStyle(
//               fontFamily: 'comingSoon',
//               fontSize: 12,
//               fontWeight: .w400,
//               color: AppColors.madder,
//             ),

//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 widget.radius ?? scaleFactor * 30,
//               ),
//               borderSide: BorderSide(
//                 color: widget.borderColor ?? AppColors.heatherGrey,
//                 width: 1,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 widget.radius ?? scaleFactor * 30,
//               ),
//               borderSide: BorderSide(
//                 color: widget.borderColor ?? AppColors.heatherGrey,
//                 width: 1,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 widget.radius ?? scaleFactor * 30,
//               ),
//               borderSide: BorderSide(
//                 color: widget.borderColor ?? AppColors.heatherGrey,
//                 width: 1,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 widget.radius ?? scaleFactor * 30,
//               ),
//               borderSide: BorderSide(color: AppColors.madder, width: 1),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 widget.radius ?? scaleFactor * 30,
//               ),
//               borderSide: BorderSide(color: AppColors.madder, width: 1),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }