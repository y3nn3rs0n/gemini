import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gemini_test/chat_provider.dart';
import 'package:gemini_test/extension.dart';
import 'package:gemini_test/widgets/arrow_down_button.dart';
import 'package:gemini_test/widgets/chat_actions_widget.dart';
import 'package:gemini_test/widgets/gradient_appbar.dart';
import 'package:gemini_test/widgets/me_chat_widget.dart';
import 'package:gemini_test/widgets/response_chat_widget.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatScreen> {
  var message = "";
  TextEditingController controller = TextEditingController();
  File? pickedFile;

  // List<Message> msg = [];
  final _controller = ScrollController();
  bool isBottom = false;

  void init() async {}

  void checkForAutoScroll() {
    if (!_controller.hasClients) return;
    if (_controller.position.atEdge) {
      isBottom = _controller.position.pixels != 0;
      if (isBottom) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        });
      }
    }
  }

  List<Widget> generateChats(ChatProvider provider) {
    final List<Widget> list = provider.chats.map((chat) {
      if (chat.isRequest) {
        return MeChatWidget(
            img: chat.img,
            username: 'You',
            msg: chat.msg,
            time: DateTime.now().toIso8601String().substring(0, 10));
      }
      return ResponseChatWidget(
          username: 'Gemini',
          msg: chat.msg,
          time: DateTime.now().toIso8601String().substring(0, 10));
    }).toList();

    return [
      ...list,
      provider.isLoading
          ? Center(
              child: SpinKitWave(
              color: context.primaryColor.scaleRGB(1),
            )).withPadding(12.topPadding)
          : const SizedBox()
    ];
  }

  @override
  Widget build(BuildContext context) {
    init();
    checkForAutoScroll();
    final notifier = context.read<ChatProvider>();
    return Scaffold(
      appBar: GradientAppBar(),
      backgroundColor: Colors.grey[350],
      body: GestureDetector(
          onTap: () => 
        FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Consumer<ChatProvider>(builder: (context, provider, widget) {
                    final list = generateChats(provider);
                    return ListView.builder(
                        controller: _controller,
                        itemCount: notifier.chats.length + 1,
                        itemBuilder: (context, index) => list[index]);
                  }),
                  Positioned(
                      bottom: 10,
                      right: 0,
                      child: ArrowDownButton(controller: _controller)),
                ],
              )),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      minLines: 1,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (_) => message = _,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: context.primaryColor.scaleRGB(.7)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 183, 253, 1),
                              width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0),
                        ),
                        hintText: 'Write your message here....',
                      ),
                    ),
                  ),
                  8.widthBox,
                  ChatActionsWidget(
                    onPicked: (_) {
                      pickedFile = _;
                    },
                    onRemove: () {
                      pickedFile = null;
                    },
                    onSend: () {
                      controller.clear();
                      if (pickedFile == null) {
                        notifier.sendMessage(message);
                      } else {
                        notifier.sendWithImage(message, pickedFile!);
                        pickedFile = null;
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

