import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pc_url/core/configs/styles/app_colors.dart';
import 'package:pc_url/core/providers/short_url_provider.dart';
import 'package:pc_url/features/convert-url/models/short_url.dart';
import 'package:pc_url/features/convert-url/repositories/short_url_repository.dart';
import 'package:pc_url/features/convert-url/repositories/short_url_repository_impl.dart';
import 'package:pc_url/features/convert-url/views/widgets/input_url.dart';
import 'package:pc_url/features/convert-url/views/widgets/short_url_container.dart';

class ConvertUrlPage extends ConsumerStatefulWidget {
  const ConvertUrlPage({Key? key}) : super(key: key);

  @override
  _ConvertUrlPageState createState() => _ConvertUrlPageState();
}

class _ConvertUrlPageState extends ConsumerState<ConvertUrlPage> {
  TextEditingController urlController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ShortUrlRepository shortUrlRepository = ShortUrlRepositoryImpl();

  bool isURLValid(String text) {
    final RegExp urlRegex = RegExp(
      r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );

    return urlRegex.hasMatch(text);
  }

  void transformUrl() async{
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final ShortUrl res = await shortUrlRepository.getShortUrl(urlController.text);
      ref.read(shortUrlProvider.notifier).update((state) => res.resultURL ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child:Form(
            key: _formKey,
            child: Row(children: [
              Expanded(
                  child: InputUrl(
                labelText: "URL",
                controller: urlController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese una URL.';
                  }
                  if (!isURLValid(value)) {
                    return 'URL no válida. Por favor, ingrese una URL válida.';
                  }
                  return null;
                },
              )),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 10),
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    transformUrl();
                  },
                  icon: const Icon(Icons.send),
                  color: AppColors.white,
                ),
              )
            ]))),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ShortUrlContainer())
      ],
    );
  }
}
