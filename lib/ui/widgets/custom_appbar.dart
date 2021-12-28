import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  CustomAppBar({
    Key? key,
    required this.screenName,
    required this.color,
    required this.actions
  }) : super(key: key);

  final String screenName;
  final Color color;
  List<Widget> actions ;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          screenName,
          style: textTheme.headline2!.copyWith(color: color),
        ),
        centerTitle: true,
        actions: actions);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
