part of '../home_screen.dart';

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 86, bottom: 90, left: 16, right: 16),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: _buildHeaderContainer(context),
            ),
            Positioned.fill(
              child: _buildBodyListView(context),
            ),
          ],
        ),
      );

  Widget _buildHeaderContainer(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F7FA),
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildUpMenu(context),
            const SizedBox(height: 16),
            _buildDropDown(context),
            const SizedBox(height: 8),
            _buildShowNumber(context),
          ],
        ),
      );

  Widget _buildBodyListView(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 178),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => _buildMainItem(context),
        ),
      );

  Widget _buildUpMenu(BuildContext context) => BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) => previous.currentOfUpMenu != current.currentOfUpMenu,
        builder: (context, state) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: state.listOfUpMenu
              .map(
                (element) => ButtonMenu(
                  element: element,
                  onTap: () => context.read<HomeScreenBloc>().add(
                        HomeScreenEvent.pressedOnUpMenu(element),
                      ),
                ),
              )
              .toList(),
        ),
      );

  Widget _buildDropDown(BuildContext context) => BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) => previous.currentTextForDropDown != current.currentTextForDropDown,
        builder: (context, state) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: DropdownButton<String>(
            menuMaxHeight: 200,
            underline: const SizedBox(),
            dropdownColor: Colors.white,
            value: state.currentTextForDropDown,
            items: state.textForDropDown
                .map<DropdownMenuItem<String>>(
                  (element) => DropdownMenuItem(
                    value: element,
                    child: Text(
                      element,
                      style: const TextStyle(color: Color(0xFF29364E), fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                )
                .toList(),
            onChanged: (String? element) => element != null
                ? context.read<HomeScreenBloc>().add(HomeScreenEvent.pressedOnItemInDropDown(element))
                : null,
            isExpanded: true,
            icon: SvgPicture.asset('assets/images/arrow_down.svg'),
          ),
        ),
      );
}

Widget _buildShowNumber(BuildContext context) => Row(
      children: <Widget>[
        SvgPicture.asset('assets/images/checkmark.svg'),
        const SizedBox(width: 8),
        const Text(
          'Show number without verification',
          style: TextStyle(color: Color(0xFF29364E), fontWeight: FontWeight.w400, fontSize: 14),
        ),
      ],
    );

Widget _buildMainItem(BuildContext context) => BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (previous, current) => previous.listOfItemModel != current.listOfItemModel,
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(state.flagPath),
                  const SizedBox(width: 4),
                  Text(
                    state.country,
                    style: const TextStyle(color: Color(0xFF29364E), fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: state.listOfItemModel.map((element) => RowItem(model: element)).toList(),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
