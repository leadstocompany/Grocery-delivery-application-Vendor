import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios_outlined)),
          ),
        ),
        title: const Text(
          "Message",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 0, bottom: 0, right: 0, top: 0),
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                messages[index].messageType == "receiver"
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10))
                                    : const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                            color: (messages[index].messageType == "receiver"
                                ? Colors.grey.shade200
                                : context.appColor.primarycolor),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(
                                fontSize: 15,
                                color: messages[index].messageType == "receiver"
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                      ),
                    ),
                    messages[index].messageType == "receiver"
                        ? Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "12:33 AM",
                                style: context.subTitleTxtStyleblack,
                                // style: context.customMedium(
                                //     Colors.grey.withOpacity(0.6), 12),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                "12:33 AM",
                                style: context.subTitleTxtStyleblack,
                                // style: context.customMedium(
                                //     Colors.grey.withOpacity(0.6), 12),
                              ),
                            ),
                          )
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 10, top: 10, right: 10),
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.camera_alt_outlined),
                            hintText: "Type Something...",
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                            border: InputBorder.none,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15)),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: context.appColor.primarycolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
