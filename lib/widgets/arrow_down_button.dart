import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ArrowDownButton extends StatefulWidget {
  final ScrollController controller;

  const ArrowDownButton({super.key, required this.controller});

  @override
  State<ArrowDownButton> createState() => _ArrowDownButtonState();
}

class _ArrowDownButtonState extends State<ArrowDownButton> {
  bool isBottom = false;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (!widget.controller.hasClients) return;
      if (widget.controller.position.atEdge) {
        setState(() {
          isBottom = widget.controller.position.pixels != 0;
          if (isBottom) opacity = 0;
        });
      } else if (isBottom) {
        setState(() {
          opacity = 1;
          isBottom = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: 200.ms,
      child: IconButton(
        iconSize: 40,
        color: Colors.white,
        onPressed: () {
          if (!isBottom) {
            widget.controller
                .jumpTo(widget.controller.position.maxScrollExtent);
          }
        },
        icon: const Icon(Icons.arrow_drop_down_circle_sharp,),
      ),
    );
  }
}