// import 'package:flutter/material.dart';
//
// enum PlanTextFieldType {
//   username,
//   email,
//   password,
// }
//
// class CustomPlanTextField extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final TextFieldType textFieldType;
//   const CustomPlanTextField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData().copyWith(
//         colorScheme:
//             ThemeData().colorScheme.copyWith(primary: AppColor.kPrimaryBlue),
//       ),
//       child: TextFormField(
//         controller: textEditingController,
//         textAlignVertical: TextAlignVertical.center,
//         style: const TextStyle(
//             fontFamily: AppSettings.kAppFont,
//             color: AppColor.kPrimaryBlue,
//             fontSize: 16.5),
//         decoration: InputDecoration(
//           hintStyle:
//               const TextStyle(fontFamily: AppSettings.kAppFont, fontSize: 16.5),
//           enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: AppColor.kPrimaryBlue)),
//           prefixIcon: prefix,
//           suffixIcon: suffix,
//           hintText: hintText,
//           focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: AppColor.kPrimaryBlue)),
//         ),
//       ),
//     );
//   }
// }
