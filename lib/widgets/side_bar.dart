import 'package:flutter/material.dart';
import 'package:perplexity_ai/theme/colors.dart';
import 'package:perplexity_ai/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: isCollapsed ? 65 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          SizedBox(height: 10),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: isCollapsed ? 30 : 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isCollapsed
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.add,
                  text: "Home",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.search,
                  text: "Search",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.language,
                  text: "Discover",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.auto_awesome,
                  text: "Generate",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.cloud_outlined,
                  text: "Library",
                ),
                Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
