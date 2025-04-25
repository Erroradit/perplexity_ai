import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perplexity_ai/widgets/answer_section.dart';
import 'package:perplexity_ai/widgets/side_bar.dart';
import 'package:perplexity_ai/widgets/sources_section.dart';

class ChatPage extends StatefulWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? SideBar() : SizedBox(),
          kIsWeb ? SizedBox(width: 100) : SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.question,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 20),

                    //sources
                    SourcesSection(),
                    SizedBox(height: 20),
                    //answer section
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          //Placeholder(strokeWidth: 0, color: AppColors.background),
        ],
      ),
    );
  }
}
