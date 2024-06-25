import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gemini_test/extension.dart';

class MeChatWidget extends StatelessWidget {
  final String username;
  final String msg;
  final String time;
  final File? img;

  const MeChatWidget(
      {super.key, required this.username, required this.msg, required this.time, this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Wrap(
          alignment: WrapAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                     /* Wrap(
                        children: [
                           Text(
                            time,
                            style: const TextStyle(color: Colors.white38),
                          ), 
                          12.widthBox,
                          Text(
                            username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: context.primaryColor.scaleRGB(.7)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),*/
                      if(img != null)  
                      Image.file(img!, height: 100),  
                      Text(
                        msg,
                        maxLines: 10,
                        style: TextStyle(color: context.primaryColor.scaleRGB(.7)),
                      ),
                      const SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: double.infinity,
            )
          ],
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
