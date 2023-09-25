import '../../../../presenter/getx_login_presenter.dart';
import '../../../../ui/login/login_presenter.dart';
import '../../../usecase/login_auth_impl.dart';

LoginPresenter makeLoginPresenter() =>
    GetxLoginPresenter(authentication: makeLoginAuthImpl());
