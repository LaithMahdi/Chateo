import 'package:chateo/src/api/api.dart';
import 'package:chateo/src/api/crud.dart';
import 'package:chateo/src/core/enum/statusRequest.dart';
import 'package:chateo/src/data/model/message_model.dart';
import 'package:chateo/src/view/screens/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

import '../../../core/function/handling_data.dart';
import '../../../data/remote/messages/message_remote_data.dart';

abstract class PersonalChatController extends GetxController {}

class PersonalChatControllerImpl extends PersonalChatController {
  InitialControllerImpl initial = Get.find();
  late String _id;
  late String _username;
  late String _idSender;
  late TextEditingController _message;
  final ScrollController _scrollController = ScrollController();
  late Io.Socket socket;
  bool _isSend = false;
  StatusRequest _statusRequest = StatusRequest.none;
  final MessageRemoteData _messageRemoteData = MessageRemoteData(Crud());
  final List<MessageModel> _messages = [];

  //Getter

  List<MessageModel> get messages => _messages;
  String get username => _username;
  String get idSender => _idSender;
  TextEditingController get message => _message;
  String get id => _id;

  bool get isSend => _isSend;
  ScrollController get scrollController => _scrollController;
  //

  @override
  void onInit() {
    _idSender = initial.id!;
    _username = Get.arguments["username"];
    _id = Get.arguments["id"];
    _message = TextEditingController();

    connectSocket();
    getAllMessages();
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

  void setMessage(String message, String type) {
    bool isSender = type == "sender";
    MessageModel msg = MessageModel(
        senderId: _idSender,
        message: message,
        date: DateTime.now(),
        isSender: isSender);
    messages.add(msg);

    update();
  }

  getAllMessages() async {
    var response = await _messageRemoteData.getMessagesBetweenTwoUsers(
        _id, _idSender, initial.token!);
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.success) {
      if (response["messages"] is List) {
        messages.addAll(List.generate(response["messages"].length,
            (index) => MessageModel.fromJson(response["messages"][index])));
      } else {
        _statusRequest = StatusRequest.failed;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      update();
    }
  }
}
