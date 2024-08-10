import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

class ProductByCategoryListView extends StatefulWidget {
  const ProductByCategoryListView({super.key});

  @override
  State<ProductByCategoryListView> createState() =>
      _ProductByCategoryListViewState();
}

class _ProductByCategoryListViewState extends State<ProductByCategoryListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(Scale.xs),
        child: Divider(
          color: LightColors.tertiary,
        ),
      ),
      itemBuilder: (context, index) => Column(
        children: [
          CardDefault(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleText(text: "Categoria"),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                    ],
                  ),
                  const DividerDefault(),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: Scale.xs,
                            mainAxisSpacing: Scale.xs),
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const CardDefault(
                      child: SizedBox(
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
