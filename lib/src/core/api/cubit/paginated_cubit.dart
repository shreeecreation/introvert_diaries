import 'package:dartz/dartz.dart';
import 'package:introvertdiaries/src/core/core.dart';

import '../../base/response/typedefs.dart';

abstract class PaginatedCubit<T extends Object>
    extends Cubit<BaseApiState<List<T>>> {
  PaginatedCubit() : super(const BaseApiState.initial());

  int? _nextPage = 1;
  PaginationParam? _paginationParam;

  @protected
  PaginatedEitherResponse<T> callApi({
    required PaginationParam paginationParam,
  });

  @protected
  Future<void> getList({required PaginationParam paginationParam}) async {
    emit(const BaseApiState.loading());
    _paginationParam = paginationParam;
    return _emitApiState(
      await callApi(paginationParam: _paginationParam!),
    );
  }

  Future<void> next() async {
    if (_nextPage == null) return;

    final param = 
        PaginationParam(
          page: _nextPage!,
        );
    return _emitApiState(await callApi(paginationParam: param), extend: true);
  }

  void _emitApiState(
    Either<AppError, ApiResponse<PaginationModel<T>>> response, {
    bool extend = false,
  }) {
    response.fold(
      (error) => emit(changeError(error)),
      (success) {
        _nextPage = success.data.next;
        emit(
          BaseApiState.success(
            extend
                ? [
                    ...state.maybeWhen(
                      orElse: List.empty,
                      success: (items) => items,
                    ),
                    ...success.data.records,
                  ]
                : success.data.records,
          ),
        );
      },
    );
  }
}
