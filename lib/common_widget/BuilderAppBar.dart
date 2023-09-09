import 'package:flutter/material.dart';

class BuilderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  const BuilderAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: elevation,
      centerTitle: true,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(color: Colors.blue, fontSize: 22),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
