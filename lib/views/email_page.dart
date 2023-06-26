import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:refcoins_app/core/custom_router.dart';
import 'package:refcoins_app/core/utils.dart';
import 'package:refcoins_app/views/mobile_number_page.dart';
import 'package:refcoins_app/widgets/main_container.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final _focustNode = FocusNode();
  final _controller = TextEditingController();
  bool _isTyping = false;

  String message = "Enter your email";
  Color _deviderColor = lightGrey;
  String word = "";
  void _inputMessageHandler() {
    RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    if (_controller.text.isNotEmpty) {
      if (!emailRegExp.hasMatch(_controller.text)) {
        setState(() {
          message = 'Looks Wrong';
          word = _controller.text;
          _deviderColor = Colors.red;
        });
      } else {
        setState(() {
          message = "Enter your email";
          _deviderColor = lightGrey;
          word = _controller.text;
        });
      }
    }
  }

  void onSubmit() {
    if (_controller.text.isNotEmpty) {
      if (message != "Looks Wrong") {
        Navigator.push(context, bottomPageRoute(const MobileNumberPage()));
        return;
      }
    }
    _focustNode.requestFocus();
  }

  @override
  void initState() {
    Future.delayed(defaultDuration).then((value) => _focustNode.requestFocus());
    if (!_focustNode.hasFocus) {
      Future.delayed(defaultDuration)
          .then((value) => _focustNode.requestFocus());
    }
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: MainContainer(
        padding: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/eye.png"),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3 * 2,
                    child: const Text(
                      "Nice to meet you Benjamin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3 * 2,
                    child: const Row(
                      children: [
                        Text(
                          "Whatt is your email ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LottieBuilder.asset(
                  "assets/lottie_files/typing_lottie.json",
                  animate: _isTyping,
                  height: 54,
                  width: 54,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(
                  color: message == "Looks Wrong" ? Colors.red : lightGrey,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(
              color: _deviderColor,
            ),
            TextFormField(
              focusNode: _focustNode,
              controller: _controller,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      if (message == "Looks Wrong") {
                        _controller.clear();
                      } else {
                        onSubmit();
                      }
                    });
                  },
                  icon: Icon(
                    message == "Looks Wrong" ? Icons.close : Icons.send,
                    color: message == "Looks Wrong" ? Colors.red : lightGrey,
                  ),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: lightGrey,
                    width: 2,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: lightGrey,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (val) {
                _inputMessageHandler();
              },
              onFieldSubmitted: (va) {
                onSubmit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
