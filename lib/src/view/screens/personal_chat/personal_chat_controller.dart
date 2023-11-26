import 'package:chateo/src/api/api.dart';
import 'package:chateo/src/data/model/message_model.dart';
import 'package:chateo/src/view/screens/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

abstract class PersonalChatController extends GetxController {}

class PersonalChatControllerImpl extends PersonalChatController {
  InitialControllerImpl initial = Get.find();
  late String _id;
  late String _username;
  late String _idSender;
  late TextEditingController _message;
  late ScrollController _scrollController;
  late Io.Socket socket;
  bool _isSend = false;

  final List<MessageModel> _messages = [];

  //Getter

  List<MessageModel> get messages => _messages;
  String get username => _username;
  String get idSender => _idSender;
  TextEditingController get message => _message;

  bool get isSend => _isSend;
  ScrollController get scrollController => _scrollController;
  //

  @override
  void onInit() {
    _idSender = initial.id!;
    _username = Get.arguments["username"];
    _id = Get.arguments["id"];
    _message = TextEditingController();
    _scrollController = ScrollController();
    connectSocket();
    super.onInit();
  }

  void connectSocket() {
    Map<String, dynamic> options = {
      "transports": ['websocket'],
      "autoConnect": false
    };
    socket = Io.io(Api.baseUrl, options);
    socket.connect();
    socket.onConnect((data) {
      print("user connected");
      socket.on("msg", (msg) {
        print(msg);
        setMessage(msg["message"], "destination");
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        update();
      });
    });
    socket.emit("login", _idSender);
  }

  sendMessge() {
    setMessage(message.text, "sender");

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    socket.emit("msg",
        {"message": message.text, "sender": _idSender, "destination": _id});
    _message.clear();
    _isSend = false;
  }

  setMessage(String message, String type) {
    MessageModel msg =
        MessageModel(message: message, type: type, date: DateTime.now());
    messages.add(msg);
    update();
  }
}
