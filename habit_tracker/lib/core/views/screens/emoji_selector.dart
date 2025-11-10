// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/foundation.dart' as foundation;
// import 'package:flutter/material.dart';
// import 'package:habit_tracker/core/extensions/build_context_extension.dart';
// import 'package:habit_tracker/core/localizations/app_words.dart';
// import 'package:habit_tracker/core/utils/adaptive_val.dart';
// import 'package:habit_tracker/main.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// class EmojiSelector extends StatefulWidget {
//   const EmojiSelector({super.key});

//   @override
//   State<EmojiSelector> createState() => _EmojiSelectorState();
// }

// class _EmojiSelectorState extends State<EmojiSelector> {
//   Emoji? currentEmoji;
//   TextEditingController emojiController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // SharedPreferences.setMockInitialValues({});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               AppWords.of(context).icon,
//               style: context.appText.header3,
//             ),
//             SizedBox(
//               width: Adaptive.getWidth(45),
//               child: TextField(
//                 controller: emojiController,
//                 maxLength: 1,
//                 maxLines: 1,
//                 onTap: () {
//                   // showModalBottomSheet(
//                   //   context: context,
//                   //   builder: (context) {
//                   //     return EmojiPicker(
//                   //         textEditingController: emojiController,
//                   //         // scrollController: _scrollController,
//                   //         config: Config(
//                   //           height: 256,
//                   //           checkPlatformCompatibility: true,
//                   //           viewOrderConfig: const ViewOrderConfig(),
//                   //           emojiViewConfig: EmojiViewConfig(
//                   //             // Issue: https://github.com/flutter/flutter/issues/28894
//                   //             emojiSizeMax: 28 *
//                   //                 (foundation.defaultTargetPlatform ==
//                   //                         TargetPlatform.iOS
//                   //                     ? 1.2
//                   //                     : 1.0),
//                   //           ),
//                   //           skinToneConfig: const SkinToneConfig(),
//                   //           categoryViewConfig: const CategoryViewConfig(),
//                   //           bottomActionBarConfig: const BottomActionBarConfig(),
//                   //           searchViewConfig: const SearchViewConfig(),
//                   //         ));
//                   //   },
//                   // );
//                 },
//               ),
//             ),
//           ],
//         ),
//         // EmojiPicker(
//         //     textEditingController: emojiController,
//         //     // scrollController: _scrollController,
//         //     config: Config(
//         //       height: 256,
//         //       checkPlatformCompatibility: true,
//         //       //viewOrderConfig: const ViewOrderConfig(),
//         //       emojiViewConfig: EmojiViewConfig(
//         //         // Issue: https://github.com/flutter/flutter/issues/28894
//         //         emojiSizeMax: 28 *
//         //             (foundation.defaultTargetPlatform == TargetPlatform.iOS
//         //                 ? 1.2
//         //                 : 1.0),
//         //       ),
//         //       skinToneConfig: const SkinToneConfig(),
//         //       categoryViewConfig: const CategoryViewConfig(),
//         //       bottomActionBarConfig: const BottomActionBarConfig(),
//         //       searchViewConfig: const SearchViewConfig(),
//         //     )),
//       ],
//     );
//   }
// }
