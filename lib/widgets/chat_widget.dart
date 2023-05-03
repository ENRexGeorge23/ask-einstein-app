import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_course/services/assets_manager.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.msg,
    required this.chatIndex,
    this.shouldAnimate = false,
  }) : super(key: key);

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chatIndex == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: chatIndex == 0
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (chatIndex != 0)
                Image.asset(
                  AssetsManager.botImage,
                  height: 50,
                  width: 50,
                ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: chatIndex == 0
                    ? UserChatBubble(
                        chatIndex: chatIndex,
                        child: TextWidget(
                          label: msg,
                        ),
                      )
                    : BotChatBubble(
                        chatIndex: chatIndex,
                        child: shouldAnimate
                            ? SelectableText.rich(
                                TextSpan(children: [
                                  WidgetSpan(
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                      child: AnimatedTextKit(
                                        isRepeatingAnimation: false,
                                        repeatForever: false,
                                        displayFullTextOnTap: true,
                                        totalRepeatCount: 1,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                            msg.trim(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              )
                            : SelectableText(
                                msg.trim(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                      ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (chatIndex == 0)
                Image.asset(
                  AssetsManager.userImage,
                  height: 60,
                  width: 60,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class UserChatBubble extends StatelessWidget {
  const UserChatBubble({
    Key? key,
    required this.child,
    required this.chatIndex,
  }) : super(key: key);

  final Widget child;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF007AFF),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: chatIndex == 0
                ? const Radius.circular(16)
                : const Radius.circular(0),
            bottomRight: const Radius.circular(16),
          ),
        ),
        child: child,
      ),
    );
  }
}

class BotChatBubble extends StatelessWidget {
  const BotChatBubble({
    Key? key,
    required this.child,
    required this.chatIndex,
  }) : super(key: key);

  final Widget child;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: const Radius.circular(0),
            bottomRight: chatIndex == 0
                ? const Radius.circular(0)
                : const Radius.circular(16),
          ),
        ),
        child: child,
      ),
    );
  }
}
