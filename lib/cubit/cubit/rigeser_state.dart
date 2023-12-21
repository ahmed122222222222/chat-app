part of 'rigeser_cubit.dart';

@immutable
abstract class RigeserState {}

class RigeserInitial extends RigeserState {}

class loading extends RigeserState {}

class sucess extends RigeserState {}

class failuer extends RigeserState {
  String errmass;
  failuer({required this.errmass});
}
