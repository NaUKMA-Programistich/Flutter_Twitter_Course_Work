import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter/home/bloc/home_bloc.dart';
import 'package:flutter_twitter/home/repository/home_repository.dart';

import '../components/tweet_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeRepository = context.read<HomeRepository>();
        return HomeBloc(homeRepository: homeRepository)
          ..add(HomeEventStartProcess());
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          Widget bodyContent = const SizedBox.shrink();

          if (state is HomeLoading) {
            bodyContent = const Center(child: CircularProgressIndicator());
          }

          if (state is HomeLoaded) {
            bodyContent = SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var tweet in state.tweets) TweetWidget(tweet: tweet),
                ],
              ),
            );
          }

          if (state is HomeError) {
            bodyContent = Text(state.message);
          }

          return Scaffold(
            appBar: AppBar(title: const Text('Home Screen')),
            body: bodyContent,
          );
        },
      ),
    );
  }
}
