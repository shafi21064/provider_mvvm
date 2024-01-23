
class AppException implements Exception{
  final _prefix;
  final _message;
  AppException([this._prefix, this._message]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]): super(message, 'Error During Communication');
}

class BadRequestException extends AppException{
  BadRequestException([message]) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppException{
  UnAuthorizedException([message]) : super(message, 'Unauthorized Request');
}

class InvalidInputException extends AppException{
  InvalidInputException([message]) : super(message, 'Invalid Input');
}