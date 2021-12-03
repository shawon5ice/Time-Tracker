import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/widgets/custom_buttons.dart';

// class FormSubmitButton extends StatelessWidget {
//   final String buttonText;
//   final VoidCallback callback;
//   const FormSubmitButton({ Key? key, required this.buttonText, required this.callback }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: callback,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 8, bottom: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 36,
//             ),
//             Text(
//               buttonText,
//               style: TextStyle(fontSize: 16, color: textColor),
//             ),
//             SizedBox(
//               height: 36,
//             )
//           ],
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         primary: backgroundColor,
//       ),
//     );
//   }
// }