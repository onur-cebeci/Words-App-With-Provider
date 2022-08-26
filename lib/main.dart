import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/admob_helper.dart';
import 'package:words_app_githup/controllers/card_controller.dart';
import 'package:words_app_githup/controllers/study_card_controller.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/controllers/words_controller.dart';
import 'package:words_app_githup/controllers/words_game_controller.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';
import 'package:words_app_githup/screens/home_page/home_page.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordsLocalSaveModelAdapter());
  Hive.registerAdapter(StudyWordsSaveModelAdapter());
  Hive.registerAdapter(CounterModelAdapter());

  var saveWords = await Hive.openBox<WordsLocalSaveModel>('saveWords');
  var studyWords = await Hive.openBox<StudyWordsSaveModel>('studyWords');
  var numWords = await Hive.openBox<CounterModel>('numWords');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHive();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
        ChangeNotifierProvider(create: (_) => CardController()),
        ChangeNotifierProvider(create: (_) => StudyCardController()),
        ChangeNotifierProvider(create: (_) => WordsController()),
        ChangeNotifierProvider(create: (_) => TransportTenWordsController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AdmobHelper admobHelper = AdmobHelper();
  @override
  void initState() {
    admobHelper.createIntertitialAd();
    super.initState();
    showAdMob();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'En Popüler 5000 Kelime',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(
          color: Colors.white,
          fontSize: 60,
          fontWeight: FontWeight.bold,
        )),
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }

  void showAdMob() {
    Future.delayed(const Duration(minutes: 1), () {
      admobHelper.showIntertitialAd();
    });
    Future.delayed(const Duration(minutes: 2), () {
      admobHelper.showIntertitialAd();
    });
    Future.delayed(const Duration(minutes: 4), () {
      admobHelper.showIntertitialAd();
    });
    Future.delayed(const Duration(minutes: 6), () {
      admobHelper.showIntertitialAd();
    });
  }
}
