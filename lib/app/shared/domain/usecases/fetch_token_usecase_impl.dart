import 'package:dartz/dartz.dart';
import '../helpers/errors/failure.dart';
import '../repositories/token_repository.dart';
import 'fetch_token_usecase.dart';

class FetchTokenUsecaseImpl implements FetchTokenUsecase {
  final TokenRepository _repository;
  const FetchTokenUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, String?>> call() async {
    final response = await _repository.fetchToken();
    return response;
  }
}
