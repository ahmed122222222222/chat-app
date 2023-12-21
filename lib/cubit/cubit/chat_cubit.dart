import 'package:bloc/bloc.dart';
import 'package:chat/cubit/cubit/rigeser_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../model/model.dart';
import '../../pages/widge/ccc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  addmasege({required String data, required String email}) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessagesCollections);
    try {
      messages.add({kMessage: data, kCreatedAt: DateTime.now(), 'id': email});
    } catch (e) {
      emit(faluire());
    }
  }

  getmass() {
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessagesCollections);
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messagesList=[];
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(sucess(messages: messagesList));
    });
  }
}
