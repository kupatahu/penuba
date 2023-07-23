// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:penuba/home/counter_collection.dart' as _i8;
import 'package:penuba/home/counter_cubit.dart' as _i13;
import 'package:penuba/home/counter_repo.dart' as _i9;
import 'package:penuba/home/counter_repo_impl.dart' as _i10;
import 'package:penuba/home/counter_usecase.dart' as _i11;
import 'package:penuba/local_datasource/local_db.dart' as _i3;
import 'package:penuba/trip/trip_collection.dart' as _i4;
import 'package:penuba/trip/trip_cubit.dart' as _i12;
import 'package:penuba/trip/trip_repo.dart' as _i5;
import 'package:penuba/trip/trip_repo_impl.dart' as _i6;
import 'package:penuba/trip/trip_usecase.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingletonAsync<_i3.LocalDb>(() => _i3.LocalDb.create());
    gh.lazySingletonAsync<_i4.TripCollection>(
        () async => _i4.TripCollection(await getAsync<_i3.LocalDb>()));
    gh.lazySingletonAsync<_i5.TripRepo>(
        () async => _i6.TripRepoImpl(await getAsync<_i4.TripCollection>()));
    gh.lazySingletonAsync<_i7.TripUsecase>(
        () async => _i7.TripUsecase(await getAsync<_i5.TripRepo>()));
    gh.lazySingletonAsync<_i8.CounterCollection>(
        () async => _i8.CounterCollection(await getAsync<_i3.LocalDb>()));
    gh.lazySingletonAsync<_i9.CounterRepo>(() async =>
        _i10.CounterRepoImpl(await getAsync<_i8.CounterCollection>()));
    gh.lazySingletonAsync<_i11.CounterUsecase>(
        () async => _i11.CounterUsecase(await getAsync<_i9.CounterRepo>()));
    gh.singletonAsync<_i12.TripCubit>(
        () async => _i12.TripCubit(await getAsync<_i7.TripUsecase>()));
    gh.singletonAsync<_i13.CounterCubit>(
        () async => _i13.CounterCubit(await getAsync<_i11.CounterUsecase>()));
    return this;
  }
}
