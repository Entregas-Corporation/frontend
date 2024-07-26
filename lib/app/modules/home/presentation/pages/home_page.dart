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
                IconButtonDefault(onPressed: () {}, icon: const Icon(Icons.search),),
                IconButtonDefault(
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
            const SizedBox(
              height: 80,
            ),
            CardDefault(
            onTap: (){},  
                child: const ListTile(
              title: TitleText(text: "Title"),
              subtitle: BodyText(text: "Subtitle"),
              
            )),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Expanded(
                    child: CancelButton(
                  text: "Back",
                  onPressed: () {},
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: ProgressButton(
                  text: "Continue",
                  onPressed: () {},
                ))
              ],
            )
          ],
        ),
      ),
      drawer: const Drawer(
         
      ),
    );
  }
}
