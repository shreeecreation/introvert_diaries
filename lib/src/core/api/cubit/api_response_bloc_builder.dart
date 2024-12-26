import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introvertdiaries/src/core/api/api.dart';
import 'package:introvertdiaries/src/core/extensions/widget_extension.dart';

/// A custom BlocBuilder that will emit [BaseApiState<T>] states.
///
/// Useful for state management that requires api call.
class ApiResponseBlocBuilder<C extends Cubit<BaseApiState<T>>, T> extends BlocBuilder<C, BaseApiState<T>> {
  const ApiResponseBlocBuilder({
    required this.successBuilder,
    this.isSliver = false,
    this.monoState = false,
    super.key,
    super.buildWhen,
  }) : super(builder: isSliver ? _defaultSliverBuilder : _defaultBuilder);

  /// Success builder that emits [T]
  final Widget Function(BuildContext, T?) successBuilder;

  /// Set true if [ApiResponseBlocBuilder] is wrapped inside sliver.
  final bool isSliver;

  /// Will only emit state wrapped in [successBuilder]
  ///
  /// Useful for widgets where other states is not required.
  ///
  /// Examples: Dropdown menu.
  final bool monoState;

  static Widget _defaultBuilder(BuildContext context, BaseApiState _) {
    return const SizedBox.shrink();
  }

  static Widget _defaultSliverBuilder(
    BuildContext context,
    BaseApiState state,
  ) {
    return SliverToBoxAdapter(child: _defaultBuilder(context, state));
  }

  @override
  Widget build(BuildContext context, BaseApiState<T> state) {
    if (monoState) {
      return state.maybeWhen(
        success: (success) => successBuilder(context, success),
        orElse: () => successBuilder(context, null),
      );
    }

    if (isSliver) {
      return state.maybeWhen(
        success: (response) => successBuilder(context, response),
        error: (error) => Center(child: Text(error)).toSliverBox,
        loading: () {
          return const Center(child: CircularProgressIndicator()).toSliverBox;
        },
        noInternet: () {
          return const Center(
            child: Text('No internet connection'),
          ).toSliverBox;
        },
        orElse: () => const SizedBox.shrink().toSliverBox,
      );
    }

    return state.maybeWhen(
      success: (response) => successBuilder(context, response),
      error: (error) => Center(child: Text(error)),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      noInternet: () => const Center(child: Text('No internet connection')),
      orElse: SizedBox.shrink,
    );
  }
}
