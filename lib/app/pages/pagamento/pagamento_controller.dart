import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/models/passagem_model.dart';
import 'package:app/app/models/transacao_model.dart';
import 'package:app/app/pages/loading_transacao/loading_transacao_controller.dart';
import 'package:app/app/repositories/interfaces/icards_repository.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:app/app/repositories/interfaces/ipasssagem_repository.dart';
import 'package:app/app/repositories/interfaces/itransacao_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PagamentoController extends GetxController with StateMixin {
  final ICardRepository _cardRepository;
  final ITransacaoRepository _transacaoRepository;
  final IPassagemRepository _passagemRepository;
  final ICarrinhoRepository _carrinhoRepository;
  final LoadingTransacaoController _loadingTransacaoController;
  PagamentoController(
    this._cardRepository,
    this._passagemRepository,
    this._transacaoRepository,
    this._carrinhoRepository,
    this._loadingTransacaoController,
  );

  List<Cartao> cartoes = [];
  bool hasCupom = false;
  Cartao? selectCard;

  @override
  void onInit() async {
    change(selectCard, status: RxStatus.empty());
    super.onInit();
    selectCard = await getUltimoCartaoUsado();
    cartoes = await getUserCardsList();
    change(
      selectCard,
      status: selectCard == null ? RxStatus.empty() : RxStatus.success(),
    );
  }

  Future<List<Cartao>> getUserCardsList() async {
    return await _cardRepository.findCardsCurrentUser();
  }

  Future<Cartao?> getUltimoCartaoUsado() async {
    return await _cardRepository.findUltimoCartaoUsadoUsuario();
  }

  setSelectCard(Cartao cartao) {
    this.selectCard = cartao;
    _cardRepository.setUltimoCartaoUsado(cartao);
    change(this.selectCard, status: RxStatus.success());
  }

  showDialogCartoes(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Meus Cartões'),
          content: SingleChildScrollView(
            child: Column(
              children: this.buildCardList(context),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildCardList(BuildContext context) {
    List<Widget> widgetList = [];

    for (Cartao cartao in cartoes) {
      widgetList.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () {
                setSelectCard(cartao);
                Navigator.of(context).pop();
              },
              leading: cartao.bandeiraPath == null
                  ? Icon(Icons.credit_card)
                  : SvgPicture.asset(
                      cartao.bandeiraPath!,
                      height: 50,
                      width: 50,
                    ),
              title: Text(
                cartao.apelido ?? cartao.bandeira.split('.')[0].toUpperCase(),
              ),
              subtitle: Text(
                '${cartao.numero[12] + cartao.numero[13] + cartao.numero[14] + cartao.numero[15]} - ${cartao.tipo}',
              ),
            ),
          ),
        ),
      );
    }

    return widgetList;
  }

  Future<void> submeterPedido(
    Cartao cartao,
    int numParcelas,
    double valorTotal,
  ) async {
    Get.offAllNamed('/loading-transacao');
    _loadingTransacaoController.changeState('Realizando Transação...');

    bool resultTransacao =
        await this._realizarTransacao(cartao, numParcelas, valorTotal);

    if (resultTransacao) {
      _loadingTransacaoController.changeState('Criando passagens...');
      bool resultCriarPassagens = await this._criarPassagens();

      if (resultCriarPassagens) {
        await _carrinhoRepository.limparCarrinhoUsuarioLogado();
        _loadingTransacaoController.changeState('Sucesso!');

        await Future.delayed(Duration(seconds: 5), () {
          Get.offAllNamed('/home');
        });
      }
    }
  }

  Future<bool> _realizarTransacao(
    Cartao cartao,
    int numParcelas,
    double valorTotal,
  ) async {
    String email = await SharedPrefService.getCurrentUser();

    Transacao transacao = Transacao(
        emailCliente: email,
        numeroParcelas: numParcelas,
        numerosFinaisCartao: cartao.numero,
        tipoCartao: cartao.tipo,
        valorTotal: valorTotal);

    bool reqTransacao = await _transacaoRepository.create(transacao);

    return reqTransacao;
  }

  Future<bool> _criarPassagens() async {
    try {
      String email = await SharedPrefService.getCurrentUser();
      List<CruzeiroPedido> listaPedidos =
          await _carrinhoRepository.getListaUserPedidos();

      for (CruzeiroPedido pedido in listaPedidos) {
        int cont = pedido.quantidade;
        do {
          Passagem passagem = Passagem(
            id: 0,
            cruzeiroId: pedido.idCruzeiro,
            pessoaCompradoraEmail: email,
          );

          bool createPassagemRequest =
              await _passagemRepository.createOrUpdate(passagem);

          if (createPassagemRequest) cont--;

          if (!createPassagemRequest) {
            throw Exception('Falha ao criar passagem');
          }
        } while (cont > 0);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
