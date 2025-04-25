import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_ai/services/chat_web_service.dart';
import 'package:perplexity_ai/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
  Father of Computer
Charles Babbage is widely recognized as the "Father of Computer." He earned this title due to his pioneering work in designing the Analytical Engine in 1837, which incorporated key concepts fundamental to modern computers, such as a processing unit (analogous to today's CPU), memory, and the ability to follow instructions (programmability) through punched cards. Although Babbage never completed a fully functional version of his machine during his lifetime, his designs laid the essential groundwork for the development of later computers.

Key Facts about Charles Babbage
Born: December 26, 1791, London, England

Major Contribution: Designed the Analytical Engine, considered the first concept of a general-purpose computer

Legacy: His ideas established the foundation for modern computing, influencing future inventors and computer scientists.

Recognition: Often referred to as the "Father of Computing" or "Father of Computer" due to his groundbreaking designs and vision.

Other Notable Pioneers
While Charles Babbage is credited as the father of computers, other figures like Alan Turing (theoretical computer science and artificial intelligence) and John Atanasoff (first electronic digital computer) have also played crucial roles in the evolution of computing. However, Babbage's Analytical Engine remains the earliest and most influential precursor to modern computers.
''';
  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perplexity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(
              Theme.of(context),
            ).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
