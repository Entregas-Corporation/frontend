import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';

class HomePage extends StatelessWidget {
  final controllerEC = TextEditingController();
  HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/ENTREGAS-LOGO-HORIZONTAL.webp',
          fit: BoxFit.cover,
          height: Scale.lg,
        ),
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Scale.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined)),
              ],
            ),
          )
        ],
      ),
      body: BodyDefault(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchInput(text: "Pesquisar..."),
            FormInput(controller: controllerEC, text: "Pesquisar..."),
            const SizedBox(
              height: 80,
            ),
            const HeadlineText(text: "Headline"),
            const TitleText(text: "Title"),
            const SubtitleText(text: "Subtitle"),
            const BodyText(
              text: "Body",
            ),
            const FooterText(text: "Footer"),
            const SizedBox(
              height: 80,
            ),
            const Row(
              children: [
                Expanded(child: CancelButton(text: "Back")),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: ProgressButton(text: "Continue"))
              ],
            )
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
