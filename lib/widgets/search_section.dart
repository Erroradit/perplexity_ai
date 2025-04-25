import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_ai/pages/chat_page.dart';
import 'package:perplexity_ai/services/chat_web_service.dart';
import 'package:perplexity_ai/theme/colors.dart';
import 'package:perplexity_ai/widgets/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Where Knowledge begins',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.whiteColor),
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: 'Focus',
                    ),
                    SizedBox(width: 12),
                    SearchBarButton(
                      text: 'Attach',
                      icon: Icons.add_circle_outline_outlined,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ChatWebService().chat(queryController.text.trim());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => ChatPage(
                                  question: queryController.text.trim(),
                                ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
