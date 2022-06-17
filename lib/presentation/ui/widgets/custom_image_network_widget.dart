import 'package:flutter/material.dart';

class CustomImageNetworkWidget extends StatelessWidget {
  final String image;

  const CustomImageNetworkWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Icon(
            Icons.sync_problem,
            size: 40,
          ),
        );
      },
    );
  }
}
