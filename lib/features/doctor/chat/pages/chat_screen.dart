import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/features/doctor/chat/widgets/chat_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> chatSample = [
    {
      'name': 'Kristine Jackson',
      'description': '“Best Consultants in Phillippines”',
    },
    {
      'name': 'Anna Holmes',
      'description': '“Best Fertility Clinic”',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  _buildBody() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            context.go('/homeScreen');
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Chat",
              style: TextStyle(
                fontSize: 24.px,
                fontWeight: FontWeight.w400,
                fontFamily: "Louize",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatSample.length,
                itemBuilder: (context, index) {
                  final chat = chatSample[index];
                  return ChatTile(
                    name: chat['name']!,
                    description: chat['description']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
