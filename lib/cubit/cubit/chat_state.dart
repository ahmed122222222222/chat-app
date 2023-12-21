part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class sucess extends ChatState {
  List<Message>  messages;
  sucess({required this.messages});
}

class faluire extends ChatState {}
