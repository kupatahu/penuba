import 'package:injectable/injectable.dart';
import 'package:penuba/common/di.config.dart';
import 'package:get_it/get_it.dart';

final get = GetIt.instance;

@injectableInit
void initDI() => get.init();
