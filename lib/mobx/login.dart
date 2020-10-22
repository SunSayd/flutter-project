import 'package:mobx/mobx.dart';
import 'package:sunrise_map/models/token.dart';
import 'package:sunrise_map/resources/auth_token_storage.dart';
import 'package:sunrise_map/resources/sr_resource.dart';

part 'login.g.dart';

class LoginStore = LoginBase with _$LoginStore;

abstract class LoginBase with Store {
  final SRResource _resource = SRResource();
  final AuthTokenStorage _tokenStorage = AuthTokenStorage();

  @observable
  String login = "";

  @observable
  String password = "";

  @observable
  bool loading = false;

  @observable
  String _errorMessage;

  @computed
  String get errorMessage => _errorMessage;

  @action
  Future<bool> signIn() async {
    loading = true;
    Token token;
    try {
      token = await _resource.login(login, password);
      _tokenStorage.setAuthToken(token.token);
    } catch (e) {
      _errorMessage = "Не удалось авторизоваться";
      loading = false;
      return false;
    }
    loading = false;
    return true;
  }
}
