import 'package:flutter/material.dart';
import 'package:gemini_test/extension.dart';

class ResponseChatWidget extends StatelessWidget {
  final String username;
  final String msg;
  final String time;

  const ResponseChatWidget(
      {super.key, required this.username, required this.msg, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 40),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(0, 183, 253, 0.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Text(
                        time,
                        style: const TextStyle(color: Colors.white38),
                      ), */
                      12.widthBox,
                      Text(
                        username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.primaryColor.scaleRGB(.7)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        msg,
                        style: TextStyle(color: context.primaryColor.scaleRGB(.7)),
                      ),
                      const SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                ),
             
                
              /*  Image.asset("assets/images/bot-profile.png", scale: 14,),  */
              ],
            ),
            const SizedBox(
              width: double.infinity,
            )
          ],
        ),
      ],
    );
  }
}
