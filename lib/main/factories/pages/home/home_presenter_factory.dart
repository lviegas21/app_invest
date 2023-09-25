import 'package:bolsa_valores/presenter/getx_home_presenter.dart';
import 'package:bolsa_valores/ui/home/home_presenter.dart';

import '../../../usecase/remote_query_params_impl.dart';

HomePresenter makeHomePresenter() => GetxHomePresenter(
    queryResultInvestimento: makeRemoteQueryInvestimentoUsecase());
