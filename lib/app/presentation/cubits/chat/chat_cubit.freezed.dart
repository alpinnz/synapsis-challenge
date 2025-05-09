// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  CubitState<Message> get createMessages => throw _privateConstructorUsedError;
  CubitState<List<Message>> get getMessages =>
      throw _privateConstructorUsedError;
  CubitState<List<MessageTemplate>> get getMessagesTemplate =>
      throw _privateConstructorUsedError;
  MessageTemplate? get messageTemplateSelected =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {CubitState<Message> createMessages,
      CubitState<List<Message>> getMessages,
      CubitState<List<MessageTemplate>> getMessagesTemplate,
      MessageTemplate? messageTemplateSelected});

  $CubitStateCopyWith<Message, $Res> get createMessages;
  $CubitStateCopyWith<List<Message>, $Res> get getMessages;
  $CubitStateCopyWith<List<MessageTemplate>, $Res> get getMessagesTemplate;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createMessages = null,
    Object? getMessages = null,
    Object? getMessagesTemplate = null,
    Object? messageTemplateSelected = freezed,
  }) {
    return _then(_value.copyWith(
      createMessages: null == createMessages
          ? _value.createMessages
          : createMessages // ignore: cast_nullable_to_non_nullable
              as CubitState<Message>,
      getMessages: null == getMessages
          ? _value.getMessages
          : getMessages // ignore: cast_nullable_to_non_nullable
              as CubitState<List<Message>>,
      getMessagesTemplate: null == getMessagesTemplate
          ? _value.getMessagesTemplate
          : getMessagesTemplate // ignore: cast_nullable_to_non_nullable
              as CubitState<List<MessageTemplate>>,
      messageTemplateSelected: freezed == messageTemplateSelected
          ? _value.messageTemplateSelected
          : messageTemplateSelected // ignore: cast_nullable_to_non_nullable
              as MessageTemplate?,
    ) as $Val);
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<Message, $Res> get createMessages {
    return $CubitStateCopyWith<Message, $Res>(_value.createMessages, (value) {
      return _then(_value.copyWith(createMessages: value) as $Val);
    });
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<List<Message>, $Res> get getMessages {
    return $CubitStateCopyWith<List<Message>, $Res>(_value.getMessages,
        (value) {
      return _then(_value.copyWith(getMessages: value) as $Val);
    });
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<List<MessageTemplate>, $Res> get getMessagesTemplate {
    return $CubitStateCopyWith<List<MessageTemplate>, $Res>(
        _value.getMessagesTemplate, (value) {
      return _then(_value.copyWith(getMessagesTemplate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CubitState<Message> createMessages,
      CubitState<List<Message>> getMessages,
      CubitState<List<MessageTemplate>> getMessagesTemplate,
      MessageTemplate? messageTemplateSelected});

  @override
  $CubitStateCopyWith<Message, $Res> get createMessages;
  @override
  $CubitStateCopyWith<List<Message>, $Res> get getMessages;
  @override
  $CubitStateCopyWith<List<MessageTemplate>, $Res> get getMessagesTemplate;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createMessages = null,
    Object? getMessages = null,
    Object? getMessagesTemplate = null,
    Object? messageTemplateSelected = freezed,
  }) {
    return _then(_$ChatStateImpl(
      createMessages: null == createMessages
          ? _value.createMessages
          : createMessages // ignore: cast_nullable_to_non_nullable
              as CubitState<Message>,
      getMessages: null == getMessages
          ? _value.getMessages
          : getMessages // ignore: cast_nullable_to_non_nullable
              as CubitState<List<Message>>,
      getMessagesTemplate: null == getMessagesTemplate
          ? _value.getMessagesTemplate
          : getMessagesTemplate // ignore: cast_nullable_to_non_nullable
              as CubitState<List<MessageTemplate>>,
      messageTemplateSelected: freezed == messageTemplateSelected
          ? _value.messageTemplateSelected
          : messageTemplateSelected // ignore: cast_nullable_to_non_nullable
              as MessageTemplate?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {this.createMessages =
          const CubitState<Message>(status: Status.initial()),
      this.getMessages =
          const CubitState<List<Message>>(status: Status.initial(), data: []),
      this.getMessagesTemplate = const CubitState<List<MessageTemplate>>(
          status: Status.initial(), data: []),
      this.messageTemplateSelected});

  @override
  @JsonKey()
  final CubitState<Message> createMessages;
  @override
  @JsonKey()
  final CubitState<List<Message>> getMessages;
  @override
  @JsonKey()
  final CubitState<List<MessageTemplate>> getMessagesTemplate;
  @override
  final MessageTemplate? messageTemplateSelected;

  @override
  String toString() {
    return 'ChatState(createMessages: $createMessages, getMessages: $getMessages, getMessagesTemplate: $getMessagesTemplate, messageTemplateSelected: $messageTemplateSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.createMessages, createMessages) ||
                other.createMessages == createMessages) &&
            (identical(other.getMessages, getMessages) ||
                other.getMessages == getMessages) &&
            (identical(other.getMessagesTemplate, getMessagesTemplate) ||
                other.getMessagesTemplate == getMessagesTemplate) &&
            (identical(
                    other.messageTemplateSelected, messageTemplateSelected) ||
                other.messageTemplateSelected == messageTemplateSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createMessages, getMessages,
      getMessagesTemplate, messageTemplateSelected);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final CubitState<Message> createMessages,
      final CubitState<List<Message>> getMessages,
      final CubitState<List<MessageTemplate>> getMessagesTemplate,
      final MessageTemplate? messageTemplateSelected}) = _$ChatStateImpl;

  @override
  CubitState<Message> get createMessages;
  @override
  CubitState<List<Message>> get getMessages;
  @override
  CubitState<List<MessageTemplate>> get getMessagesTemplate;
  @override
  MessageTemplate? get messageTemplateSelected;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
