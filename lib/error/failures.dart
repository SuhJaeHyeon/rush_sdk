abstract class Failure {}

class ServerFailure extends Failure {
  final dynamic exception;

  ServerFailure(this.exception) {
    print(['ServerFailure', exception]);
  }

  static String getExceptionMessage(Object object) {
    final ServerFailure serverFailure = object as ServerFailure;

    if (serverFailure.exception.runtimeType == String) {
      return serverFailure.exception;
    } else {
      return '네트워크 상태를 확인해주세요.';
    }
  }

  @override
  String toString() {
    return exception.toString();
  }
}

class CacheFailure extends Failure {
  final dynamic exception;

  CacheFailure(this.exception) {
    print(['CacheFailure', exception]);
  }

  @override
  String toString() {
    return exception.toString();
  }
}
