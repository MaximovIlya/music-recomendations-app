import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/core/theme.dart';
import 'package:music_recomendations/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:music_recomendations/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:music_recomendations/features/auth/domain/usecases/login_use_case.dart';
import 'package:music_recomendations/features/auth/domain/usecases/register_use_case.dart';
import 'package:music_recomendations/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:music_recomendations/features/auth/presentation/pages/login_page.dart';
import 'package:music_recomendations/features/auth/presentation/pages/register_page.dart';
import 'package:music_recomendations/features/choose_mood/data/datasource/choose_mood_remote_data_source.dart';
import 'package:music_recomendations/features/choose_mood/data/repositories/choose_mood_repository_impl.dart';
import 'package:music_recomendations/features/choose_mood/domain/usecases/choose_mood_use_case.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/pages/choose_mood_page.dart';
import 'package:music_recomendations/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:music_recomendations/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:music_recomendations/features/favorite/domain/usecases/add_favorite_use_case.dart';
import 'package:music_recomendations/features/favorite/domain/usecases/delete_favorite_use_case.dart';
import 'package:music_recomendations/features/favorite/domain/usecases/fetch_favorites_use_case.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:music_recomendations/features/favorite/presentation/pages/favorite_page.dart';
import 'package:music_recomendations/features/recomendations/presentation/pages/recomendations_page.dart';
import 'package:music_recomendations/home_page.dart';

void main() async {

  
  
  final authRepository =
      AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSource());
  final chooseMoodRepository = ChooseMoodRepositoryImpl(remoteDataSource: ChooseMoodRemoteDataSource());

  final favoriteRepository =
      FavoriteRepositoryImpl(remoteDataSource: FavoriteRemoteDataSource());
  
  runApp(MyApp(
    authRepository: authRepository,
    chooseMoodRepository: chooseMoodRepository,
    favoriteRepository: favoriteRepository,
    
    
    
  ));

}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  final ChooseMoodRepositoryImpl chooseMoodRepository;
  final FavoriteRepositoryImpl favoriteRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.chooseMoodRepository,
    required this.favoriteRepository,
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

        BlocProvider(
          create: (_) => FavoriteBloc(
            addFavoriteUseCase: AddFavoriteUseCase(favoriteRepository: favoriteRepository),
            deleteFavoriteUseCase: DeleteFavoriteUseCase(favoriteRepository: favoriteRepository),
            fetchFavoritesUseCase: FetchFavoritesUseCase(favoriteRepository: favoriteRepository),
          ),
        ),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: LoginPage(),
        routes: {
          '/home': (_) => HomePage(),
          '/login': (_) => LoginPage(),
          '/register': (_) => RegisterPage(),
          '/chooseMoodPage': (_) => ChooseMoodPage(),
          '/recomendationsPage': (_) => RecomendationsPage(),
          '/favoritePage': (_) => FavoritePage(),
        },
      ),
    );
  }
}
