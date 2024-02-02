import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../helpers/colors.dart';
import '../helpers/style.dart';

///
// ignore: must_be_immutable
class Bubble extends StatelessWidget {
  const Bubble({
    required this.me,
    required this.index,
    Key? key,
    this.voice = false,
    this.msg = '',
  }) : super(key: key);
  final bool me, voice;
  final int index;
  final String msg;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.2.w, vertical: 2.w),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          textDirection: me ? TextDirection.rtl : TextDirection.ltr,
          children: [
            _bubble(context),
            SizedBox(width: 2.w),
            _seenWithTime(context),
          ],
        ),
      );

  Widget _bubble(BuildContext context) => voice
      ? VoiceMessage(
          audioSrc:
              "https://firebasestorage.googleapis.com/v0/b/eparliament-staging.appspot.com/o/requests_media%2F-NgmD7ZQhfJRkHCLHh5i%2F52146fe0-7d54-11ee-89b4-2185c327ab55.m4a?alt=media&token=493f3051-1c7c-4c3c-9759-5bd9d9acbdcc",
          me: index == 5 ? false : true,
          contactBgColor: Colors.yellow,
        )
      : Container(
          constraints: BoxConstraints(maxWidth: 100.w * .7),
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: voice ? 2.8.w : 2.5.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.w),
              bottomLeft: me ? Radius.circular(6.w) : Radius.circular(2.w),
              bottomRight: !me ? Radius.circular(6.w) : Radius.circular(1.2.w),
              topRight: Radius.circular(6.w),
            ),
            color: me ? AppColors.pink : Colors.white,
            boxShadow: me
                ? S.pinkShadow(shadow: AppColors.pink100)
                : [S.boxShadow(context, opacity: .05)],
          ),
          child: Text(
            msg,
            style: TextStyle(
              fontSize: 13.2,
              color: me ? Colors.white : Colors.black,
            ),
          ),
        );

  Widget _seenWithTime(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (me)
            Icon(
              Icons.done_all_outlined,
              color: AppColors.pink,
              size: 3.4.w,
            ),
          Text(
            '1:' '${index + 30}' ' PM',
            style: const TextStyle(fontSize: 11.8),
          ),
          SizedBox(height: .2.w)
        ],
      );
}
