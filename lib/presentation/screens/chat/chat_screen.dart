import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://imgs.search.brave.com/jbPnB3G4mvSeerbe-Z_T2irBoGei9_81twAmzT5R0wc/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/Z2V0LW1lLXBpY3R1/cmVzLW9mLXNwaWRl/ci1tYW4tdjAteTc2/YzR0dm16cGxkMS5q/cGc_d2lkdGg9NjQw/JmNyb3A9c21hcnQm/YXV0bz13ZWJwJnM9/YTIzMDJiNGE0YjE0/NmQ0MTE1OTY4Yjc3/MjAyNTg3NmM4Yzgx/NjRlMQ',
            ),
          ),
        ),
        title: Text('Hi Love'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble()
                    : MyMessageBubble();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
