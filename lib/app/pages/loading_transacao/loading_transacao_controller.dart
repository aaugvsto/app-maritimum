// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class LoadingTransacaoController extends GetxController with StateMixin {
  changeState(String texto, {RxStatus? status}) {
    change(texto, status: status ?? RxStatus.success());
  }
}
