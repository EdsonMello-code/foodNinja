import 'unit.dart';

abstract interface class Either<Left, Right> {
  Unit fold(Right? Function(Right) result, Left? Function(Left) failure);
}

class Right<L, R> implements Either<L, R> {
  final R _value;

  const Right(this._value);

  @override
  Unit fold(R? Function(R p1) result, L? Function(L p1) failure) {
    result(_value)!;

    return unit;
  }
}

class Left<L, R> implements Either<L, R> {
  final L _failure;

  const Left(this._failure);

  @override
  Unit fold(R? Function(R p1) result, L? Function(L p1) failure) {
    failure(this._failure)!;

    return unit;
  }
}
