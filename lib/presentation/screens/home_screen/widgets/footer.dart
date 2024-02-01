part of '../home_screen.dart';

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) => previous.currentOfBottomMenu != current.currentOfBottomMenu,
        builder: (context, state) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          constraints: const BoxConstraints(minHeight: 90),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F7FA),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.listOfBottomMenu
                .map(
                  (element) => element.isVertical
                      ? NavigationColumnButton(
                          menu: element,
                          onTap: () => context.read<HomeScreenBloc>().add(
                                HomeScreenEvent.pressedOnBottomMenu(element),
                              ),
                        )
                      : NavigationRowButton(
                          menu: element,
                          onTap: () => context.read<HomeScreenBloc>().add(
                                HomeScreenEvent.pressedOnBottomMenu(element),
                              ),
                        ),
                )
                .toList(),
          ),
        ),
      );
}
