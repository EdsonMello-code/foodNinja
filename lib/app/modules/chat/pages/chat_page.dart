import 'package:flutter/material.dart';
import 'package:foodninja/app/core/widgets/back_button_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/chat/models/chat_model.dart';
import 'package:foodninja/app/modules/chat/pages/widgets/chat_card_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chats = [
    ChatModel(
      imageUrl: 'assets/images/avatar1.png',
      name: 'Anamwp',
      updateAt: DateTime.now(),
      description: 'Your Order Just Arrived!',
    ),
    ChatModel(
      imageUrl: 'assets/images/avatar2.png',
      name: 'Guy Hawkins',
      updateAt: DateTime.now(),
      description: 'Your Order Just Arrived!',
    ),
    ChatModel(
      imageUrl: 'assets/images/avatar3.png',
      name: 'Leslie Alexander',
      updateAt: DateTime.now(),
      description: 'Your Order Just Arrived!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: Padding(
        padding: EdgeInsets.only(
          top: padding.top,
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: size.height - padding.top,
            maxWidth: size.width,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage(
                'assets/images/background_sliced.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: padding.top,
          ),
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsetsDirectional.only(
                  top: 38,
                  bottom: 19,
                ),
                sliver: SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: BackButtonWidget(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TextWidget.inter(
                  'Chat',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ChatCardWidget(
                      chatModel: chat,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
