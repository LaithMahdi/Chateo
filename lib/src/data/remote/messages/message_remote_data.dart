import 'package:chateo/src/api/crud.dart';
import '../../../api/api.dart';

class MessageRemoteData {
  Crud crud;
  MessageRemoteData(this.crud);

  getMessagesBetweenTwoUsers(
      String receiverId, String senderId, String token) async {
    var response = await crud.fetchData(
        Api.getMessageBetweenTwoUsers(senderId, receiverId), token);
    return response.fold((l) => l, (r) => r);
  }
}
