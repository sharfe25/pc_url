import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pc_url/core/configs/styles/app_colors.dart';
import 'package:pc_url/core/providers/short_url_provider.dart';

class ShortUrlContainer extends ConsumerStatefulWidget {
  const ShortUrlContainer({Key? key}) : super(key: key);

  @override
  _ShortUrlContainerState createState() => _ShortUrlContainerState();
}

class _ShortUrlContainerState extends ConsumerState<ShortUrlContainer> {

  @override
  Widget build(BuildContext context) {
    final String shortUrl = ref.watch(shortUrlProvider);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.secondary), // Cambia esto al color que desees
        borderRadius:
            BorderRadius.circular(8.0), // Cambia el radio si es necesario
      ),
      child: Row(children: [const Text("Short URL: ", style: TextStyle(fontWeight: FontWeight.bold),), Text(shortUrl)]),
    );
  }
}
