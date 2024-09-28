import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdax_work_trial/common/colors.dart/colors.dart';
import 'package:pdax_work_trial/core/dependency_injections/dependency_injections.dart';
import 'package:pdax_work_trial/features/person_list/presentation/bloc/bloc.dart';
import 'package:pdax_work_trial/features/person_list/presentation/screen/person_list_screen.dart';

void main() {
  ServiceLocator.setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListBloc>(
          create: (context) => serviceLocator.get<PersonListBloc>()
            ..add(PersonListInitialFetched()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const PersonListScreen(),
      ),
    );
  }
}
