import 'package:flutter/material.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const SecondaryAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      primary: false,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(24);
}
