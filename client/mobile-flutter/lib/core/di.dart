import 'package:injectable/injectable.dart';
import 'package:penuba/core/di.config.dart';
import 'package:get_it/get_it.dart';

final get = GetIt.instance;

@injectableInit
Future<void> initDI() async{
  get.init();
  await get.allReady();
}
