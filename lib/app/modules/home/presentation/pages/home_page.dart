import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: const BodyDefault(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineText(text: "Headline"),
            TitleText(text: "Title"),
            SubtitleText(text: "Subtitle"),
            BodyText(
              text: "Body",
            ),
            FooterText(text: "Footer"),
            SizedBox(
              height: 80,
            ),
            Row(
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
