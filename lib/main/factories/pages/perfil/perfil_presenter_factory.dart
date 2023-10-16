import '../../../../presenter/getx_perfil_presenter.dart';
import '../../../../ui/perfil/perfil_presenter.dart';
import '../../../usecase/remote_query_corretora_impl.dart';

PerfilPresenter makePerfilPresenter() => GetxPerfilPresenter(
    queryInserindoCorretora: makeRemoteQueryCorretoraUser());
