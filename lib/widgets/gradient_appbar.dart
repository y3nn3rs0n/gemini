import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const GradientAppBar({super.key});
     @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(0, 81, 207, 1), Color.fromRGBO(0, 183, 253, 1),Color.fromRGBO(0, 81, 207, 1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          title: Text('Chat Bot', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
          backgroundColor: Colors.transparent,
          elevation: 0,  // Elimina la sombra debajo del AppBar si lo deseas
        ),
      ),
    );
  }

    @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}