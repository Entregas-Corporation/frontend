import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

class StoreListView extends StatefulWidget {
  const StoreListView({super.key});

  @override
  State<StoreListView> createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: 12,
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: Scale.xs),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: LightColors.tertiary,
                width: 2,
              ),
              color: LightColors.tertiary,
              image: const DecorationImage(
                image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.oxjFL1dNYLfGdXzB6r_4yAHaEK?rs=1&pid=ImgDetMain"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
