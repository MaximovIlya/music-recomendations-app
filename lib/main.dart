
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:music_recomendations/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:music_recomendations/features/auth/domain/usecases/login_use_case.dart';
import 'package:music_recomendations/features/auth/domain/usecases/register_use_case.dart';
import 'package:music_recomendations/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:music_recomendations/features/auth/presentation/pages/login_page.dart';
import 'package:music_recomendations/features/auth/presentation/pages/register_page.dart';
import 'package:music_recomendations/features/choose_mood/data/datasource/choose_mood_remote_data_source.dart';
import 'package:music_recomendations/features/choose_mood/data/repositoies/choose_mood_repository_impl.dart';
import 'package:music_recomendations/features/choose_mood/domain/usecases/choose_mood_use_case.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/pages/choose_mood_page.dart';

void main() async {

  
  
  final authRepository =
      AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSource());
  final chooseMoodRepository = ChooseMoodRepositoryImpl(remoteDataSource: ChooseMoodRemoteDataSource());
  
  runApp(MyApp(
    authRepository: authRepository,
    chooseMoodRepository: chooseMoodRepository,
    
    
    
  ));

}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  final ChooseMoodRepositoryImpl chooseMoodRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.chooseMoodRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            registerUseCase: RegisterUseCase(repository: authRepository),
            loginUseCase: LoginUseCase(repository: authRepository),
          ),
        ),

        BlocProvider(
          create: (_) => ChooseMoodBloc(
            chooseMoodUseCase: ChooseMoodUseCase(chooseMoodRepository: chooseMoodRepository)
          ),
        ),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          '/login': (_) => LoginPage(),
          '/register': (_) => RegisterPage(),
          '/chooseMoodPage': (_) => ChooseMoodPage()
        },
      ),
    );
  }
}
