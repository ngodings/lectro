import 'package:bloc/bloc.dart';
import 'package:lectro/models/price.dart';
import 'package:lectro/repositories/price_packet_repository.dart';
import 'package:meta/meta.dart';

part 'price_packet_state.dart';

class PricePacketCubit extends Cubit<PricePacketState> {
  PricePacketCubit() : super(PricePacketInitial());

  final _repo = PricePacketRepository();

  Future<void> getkWhPacket(PricePacket? packet) async {
    if (packet == null) {
      emit(PricePacketLoading());
      final res = await _repo.getPricePacketData();

      if (res.statusCode == 200) {
        emit(PricePacketSuccess(res.data));
      } else {
        emit(PricePacketFailed(res.message ?? ''));
      }
    } else {
      emit(PricePacketSuccess(packet));
    }
  }
}
