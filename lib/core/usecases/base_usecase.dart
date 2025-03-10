import 'package:dartz/dartz.dart';

import '../errors/failure.dart';


abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
