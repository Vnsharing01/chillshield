import 'package:chillshield/data/local/hive_local_db.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

final SharedPreferences preferences = getIt<SharedPreferences>();
final HiveLocalDb hiveLocalDb = getIt<HiveLocalDb>();