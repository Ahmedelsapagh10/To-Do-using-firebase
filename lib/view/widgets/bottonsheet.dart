// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../constants.dart';
// import '../../style.dart';

// class BottonsheetItems extends StatefulWidget {
//   void Function()? onTap;
//   String? text;
//   BottonsheetItems({required this.onTap, required this.text, super.key});

//   @override
//   State<BottonsheetItems> createState() => _BottonsheetItemsState();
// }

// class _BottonsheetItemsState extends State<BottonsheetItems> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: InkWell(
//         onTap: widget.onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width / 1.2,
//             height: MediaQuery.of(context).size.width / 8,
//             decoration: BoxDecoration(
//                 color: buColor, borderRadius: BorderRadius.circular(12)),
//             child: Text(
//               widget.text!,
//               style: MyTheme.headingStyle,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
