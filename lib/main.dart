import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'features/chat/presentation/bloc/chat_bloc.dart';
import 'features/chat/presentation/pages/responsive_chat_page.dart';
import 'core/navigation/responsive_navigation.dart';
import 'core/theme/responsive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MedicalChatApp());
}

class MedicalChatApp extends StatelessWidget {
  const MedicalChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ChatBloc>(create: (context) => sl<ChatBloc>())],
      child: MaterialApp(
        title: 'المساعد الطبي الذكي',
        debugShowCheckedModeBanner: false,
        theme: ResponsiveTheme.getTheme(context),
        initialRoute: ResponsiveNavigation.home,
        routes: ResponsiveNavigation.getRoutes(),
      ),
    );
  }
}
