
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget  with PreferredSizeWidget {
  const CustomAppBar({
    Key? key, required this.pageName, required this.color,
  }) : super(key: key);

  final String pageName ;
  final Color color;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(pageName, style: textTheme.headline2!.copyWith(color: color), ),
      centerTitle: true,
      actions:[ IconButton(icon: const Icon(Icons.search), onPressed: () {  },),]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
