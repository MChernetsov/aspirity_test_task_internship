part of 'view_post_bloc.dart';

@freezed
class ViewPostEvent with _$ViewPostEvent {
  const factory ViewPostEvent.started({
    required int id,
  }) = _Started;
}
