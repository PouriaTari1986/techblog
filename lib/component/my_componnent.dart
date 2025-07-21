import 'package:flutter/material.dart';
import 'package:my_blog/Models/fake_data/fake_data.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/gen/assets.gen.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.2,
      color: SolidColors.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}
class TagList extends StatelessWidget {
   const TagList({
    required this.textTheme,
    required this.index,
    super.key,

  });

  final TextTheme textTheme;
  
  final int index;

  @override
  Widget build(BuildContext context) {

   
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(tagList[index].title, style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
