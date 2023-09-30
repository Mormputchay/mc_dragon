import 'package:flutter/material.dart';

class BuilderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final bool? centerTitle;
  final Color? color;
  const BuilderAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.elevation,
    this.color,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading,
      title: Text(
        title!,
        style:
            TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
