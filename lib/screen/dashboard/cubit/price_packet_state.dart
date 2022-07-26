part of 'price_packet_cubit.dart';

@immutable
abstract class PricePacketState {}

class PricePacketInitial extends PricePacketState {}

class PricePacketLoading extends PricePacketState {}

class PricePacketSuccess extends PricePacketState {
  final PricePacket packet;
  PricePacketSuccess(this.packet);
}

class PricePacketFailed extends PricePacketState {
  final String errors;
  PricePacketFailed(this.errors);
}
