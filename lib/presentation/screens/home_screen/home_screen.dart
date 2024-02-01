import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/presentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:test_project/presentation/widgets/base_buttons/button_menu.dart';
import 'package:test_project/presentation/widgets/column_widgets/navigation_column_button.dart';
import 'package:test_project/presentation/widgets/containers/icon_in_circle.dart';
import 'package:test_project/presentation/widgets/row_widgets/row_item.dart';
import 'package:test_project/presentation/widgets/progress_indicator/base_loader.dart';
import 'package:test_project/presentation/widgets/row_widgets/navigation_row_button.dart';

part 'widgets/body.dart';

part 'widgets/footer.dart';

part 'widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
        builder: (context, state) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarContrastEnforced: true,
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: state.isLoading
                  ? const Center(
                      child: BaseLoader(size: 75),
                    )
                  : Stack(
                      children: const <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: _Header(),
                        ),
                        Positioned.fill(
                          child: _Body(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: _Footer(),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
}
