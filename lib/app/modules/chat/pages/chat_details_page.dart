import 'package:flutter/material.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/modules/chat/models/chat_message_model.dart';
import 'package:foodninja/app/modules/chat/pages/widgets/chat_details_card_widget.dart';
import 'package:foodninja/app/modules/chat/pages/widgets/chat_message_widget.dart';
import 'package:foodninja/app/modules/chat/pages/widgets/text_chat_text_field_widget.dart';

import '../../../core/widgets/text_widget.dart';

class ChatDetailsPage extends StatelessWidget {
  final ChatMessageModel chatMessageModel;

  const ChatDetailsPage({
    super.key,
    required this.chatMessageModel,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: context.appTheme.white,
      floatingActionButton: const TextChatTextFieldWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        constraints: BoxConstraints(
          minHeight: size.height - padding.top,
          maxWidth: size.width,
        ),
        decoration: BoxDecoration(
          color: context.appTheme.white,
          image: const DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(
              'assets/images/splash_background.png',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        padding: padding.copyWith(
          left: padding.left + 25,
          right: padding.right + 25,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(top: 38.0),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: BackButtonWidget(),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                top: 19,
                bottom: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: TextWidget.inter(
                  'Chat',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ChatCardDetailsWidget(
                imageUrl: chatMessageModel.imageUrl,
                isOnline: false,
                name: chatMessageModel.name,
                onCallTap: () {
                  Navigator.of(context).pushNamed(
                    '/call',
                    arguments: chatMessageModel,
                  );
                },
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChatMessageWidget(
                      text: 'Just to order ',
                      isMe: true,
                    ),
                    ChatMessageWidget(
                      text:
                          'Just to order orderorder order order order order order order',
                      isMe: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
