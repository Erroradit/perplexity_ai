import 'package:flutter/material.dart';
import 'package:perplexity_ai/theme/colors.dart';

class SideBarButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String text;
  const SideBarButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 26),
        ),
        isCollapsed ? SizedBox() : Text(text, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
