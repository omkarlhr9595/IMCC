abstract class UseCase<Output, Input> {
  Future<Output> call(Input params);
}

class NoParams {
  const NoParams();
}

