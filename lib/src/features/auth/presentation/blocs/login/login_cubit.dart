import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/domain/repository/auth_repository.dart';
part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repository) : super(const LoginState.initial());

  final AuthenticationRemoteSource _repository;

  void login(Map<String, dynamic> values) async {
    emit(const LoginState.loading());
    final response = await _repository.login(values);
    emit(response.fold(
      (error) => error.when(
        serverError: (error) => LoginState.error(message: error),
        noInternet: (error) => LoginState.error(message: error.message),
      ),
      (message) => LoginState.success(message: message.message ?? 'Success'),
    ));
  }
}
