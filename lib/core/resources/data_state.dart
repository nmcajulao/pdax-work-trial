import 'package:pdax_work_trial/common/models/models.dart';

abstract class DataState<T> {
  const DataState({
    this.data,
    this.error,
  });

  final T? data;
  final OperationException? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(OperationException error) : super(error: error);
}
