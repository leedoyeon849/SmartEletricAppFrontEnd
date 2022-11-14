// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'BillSimulationProductModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillSimulationProductModel _$BillSimulationProductModelFromJson(
    Map<String, dynamic> json) {
  return _BillSimulationProductModel.fromJson(json);
}

/// @nodoc
mixin _$BillSimulationProductModel {
  int? get id => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get modelName => throw _privateConstructorUsedError;
  String get typeKrName => throw _privateConstructorUsedError;
  String get typeEngName => throw _privateConstructorUsedError;
  double get monthPowerUsage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillSimulationProductModelCopyWith<BillSimulationProductModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSimulationProductModelCopyWith<$Res> {
  factory $BillSimulationProductModelCopyWith(BillSimulationProductModel value,
          $Res Function(BillSimulationProductModel) then) =
      _$BillSimulationProductModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String productName,
      String modelName,
      String typeKrName,
      String typeEngName,
      double monthPowerUsage});
}

/// @nodoc
class _$BillSimulationProductModelCopyWithImpl<$Res>
    implements $BillSimulationProductModelCopyWith<$Res> {
  _$BillSimulationProductModelCopyWithImpl(this._value, this._then);

  final BillSimulationProductModel _value;
  // ignore: unused_field
  final $Res Function(BillSimulationProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? modelName = freezed,
    Object? typeKrName = freezed,
    Object? typeEngName = freezed,
    Object? monthPowerUsage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      typeKrName: typeKrName == freezed
          ? _value.typeKrName
          : typeKrName // ignore: cast_nullable_to_non_nullable
              as String,
      typeEngName: typeEngName == freezed
          ? _value.typeEngName
          : typeEngName // ignore: cast_nullable_to_non_nullable
              as String,
      monthPowerUsage: monthPowerUsage == freezed
          ? _value.monthPowerUsage
          : monthPowerUsage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_BillSimulationProductModelCopyWith<$Res>
    implements $BillSimulationProductModelCopyWith<$Res> {
  factory _$$_BillSimulationProductModelCopyWith(
          _$_BillSimulationProductModel value,
          $Res Function(_$_BillSimulationProductModel) then) =
      __$$_BillSimulationProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String productName,
      String modelName,
      String typeKrName,
      String typeEngName,
      double monthPowerUsage});
}

/// @nodoc
class __$$_BillSimulationProductModelCopyWithImpl<$Res>
    extends _$BillSimulationProductModelCopyWithImpl<$Res>
    implements _$$_BillSimulationProductModelCopyWith<$Res> {
  __$$_BillSimulationProductModelCopyWithImpl(
      _$_BillSimulationProductModel _value,
      $Res Function(_$_BillSimulationProductModel) _then)
      : super(_value, (v) => _then(v as _$_BillSimulationProductModel));

  @override
  _$_BillSimulationProductModel get _value =>
      super._value as _$_BillSimulationProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? modelName = freezed,
    Object? typeKrName = freezed,
    Object? typeEngName = freezed,
    Object? monthPowerUsage = freezed,
  }) {
    return _then(_$_BillSimulationProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      typeKrName: typeKrName == freezed
          ? _value.typeKrName
          : typeKrName // ignore: cast_nullable_to_non_nullable
              as String,
      typeEngName: typeEngName == freezed
          ? _value.typeEngName
          : typeEngName // ignore: cast_nullable_to_non_nullable
              as String,
      monthPowerUsage: monthPowerUsage == freezed
          ? _value.monthPowerUsage
          : monthPowerUsage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BillSimulationProductModel implements _BillSimulationProductModel {
  _$_BillSimulationProductModel(
      {this.id,
      required this.productName,
      required this.modelName,
      required this.typeKrName,
      required this.typeEngName,
      required this.monthPowerUsage});

  factory _$_BillSimulationProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_BillSimulationProductModelFromJson(json);

  @override
  final int? id;
  @override
  final String productName;
  @override
  final String modelName;
  @override
  final String typeKrName;
  @override
  final String typeEngName;
  @override
  final double monthPowerUsage;

  @override
  String toString() {
    return 'BillSimulationProductModel(id: $id, productName: $productName, modelName: $modelName, typeKrName: $typeKrName, typeEngName: $typeEngName, monthPowerUsage: $monthPowerUsage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillSimulationProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality().equals(other.modelName, modelName) &&
            const DeepCollectionEquality()
                .equals(other.typeKrName, typeKrName) &&
            const DeepCollectionEquality()
                .equals(other.typeEngName, typeEngName) &&
            const DeepCollectionEquality()
                .equals(other.monthPowerUsage, monthPowerUsage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(modelName),
      const DeepCollectionEquality().hash(typeKrName),
      const DeepCollectionEquality().hash(typeEngName),
      const DeepCollectionEquality().hash(monthPowerUsage));

  @JsonKey(ignore: true)
  @override
  _$$_BillSimulationProductModelCopyWith<_$_BillSimulationProductModel>
      get copyWith => __$$_BillSimulationProductModelCopyWithImpl<
          _$_BillSimulationProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillSimulationProductModelToJson(
      this,
    );
  }
}

abstract class _BillSimulationProductModel
    implements BillSimulationProductModel {
  factory _BillSimulationProductModel(
      {final int? id,
      required final String productName,
      required final String modelName,
      required final String typeKrName,
      required final String typeEngName,
      required final double monthPowerUsage}) = _$_BillSimulationProductModel;

  factory _BillSimulationProductModel.fromJson(Map<String, dynamic> json) =
      _$_BillSimulationProductModel.fromJson;

  @override
  int? get id;
  @override
  String get productName;
  @override
  String get modelName;
  @override
  String get typeKrName;
  @override
  String get typeEngName;
  @override
  double get monthPowerUsage;
  @override
  @JsonKey(ignore: true)
  _$$_BillSimulationProductModelCopyWith<_$_BillSimulationProductModel>
      get copyWith => throw _privateConstructorUsedError;
}
