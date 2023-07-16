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
import 'package:penuba/home/counter_cubit.dart' as _i8;
import 'package:penuba/home/counter_local_db.dart' as _i4;
import 'package:penuba/home/counter_repo.dart' as _i5;
import 'package:penuba/home/counter_repo_impl.dart' as _i6;
import 'package:penuba/home/counter_usecase.dart' as _i7;
import 'package:penuba/local_db/local_db.dart' as _i3;

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
    gh.lazySingletonAsync<_i4.CounterLocalDb>(
        () async => _i4.CounterLocalDb(await getAsync<_i3.LocalDb>()));
    gh.lazySingletonAsync<_i5.CounterRepo>(
        () async => _i6.CounterRepoImpl(await getAsync<_i4.CounterLocalDb>()));
    gh.lazySingletonAsync<_i7.CounterUsecase>(
        () async => _i7.CounterUsecase(await getAsync<_i5.CounterRepo>()));
    gh.singletonAsync<_i8.CounterCubit>(
        () async => _i8.CounterCubit(await getAsync<_i7.CounterUsecase>()));
    return this;
  }
}
