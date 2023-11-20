import 'package:chateo/src/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

import '../initial/initial_controller.dart';

abstract class PersonalChatController extends GetxController {}

class PersonalChatControllerImpl extends PersonalChatController {
  final List<MessageModel> _messages = [];
  InitialControllerImpl initial = Get.find();
  late TextEditingController _message;
  late ScrollController _scrollController;
  late String _id;
  late String _username;
  late Io.Socket socket;

  // Getter
  String get id => _id;
  String get username => _username;
  TextEditingController get message => _message;
  List<MessageModel> get messages => _messages;
  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    _id = Get.arguments["id"];
    _username = Get.arguments["username"];
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
    socket = Io.io("${Api.baseUrl}/messages", options);
    socket.connect();
    socket.onConnect((data) {
      print("user connected");
      socket.on("connection", (msg) {
        update();
      });
    });
    socket.emit("login", initial.id);
  }
}
