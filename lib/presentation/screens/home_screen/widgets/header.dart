part of '../home_screen.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  final String burgerMenu = 'assets/images/burger_menu_left.svg';
  final String cart = 'assets/images/cart.svg';
  final String union = 'assets/images/union.svg';
  final String bell = 'assets/images/bell.svg';
  final Color containerColor = const Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconInCircle(color: containerColor, image: burgerMenu, border: 12),
                SizedBox(
                  width: 136,
                  child: Text(
                    state.phoneTitle,
                    style: const TextStyle(
                      color: Color(0xFF29364E),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconInCircle(color: containerColor, image: cart),
                IconInCircle(color: containerColor, image: union),
                IconInCircle(color: containerColor, image: bell),
              ],
            ),
          );
        },
      );
}
