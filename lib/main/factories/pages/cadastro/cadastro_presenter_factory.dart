import 'package:bolsa_valores/presenter/getx_cadastro_presenter.dart';

import '../../../../ui/cadastro/cadastro_presenter.dart';
import '../../../usecase/login_auth_impl.dart';

CadastroPresenter makeCadastroPresenter() =>
    GetxCadastroPresenter(authentication: makeLoginAuthImpl());
