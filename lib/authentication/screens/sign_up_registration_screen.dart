import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/provider/global_loader.dart';
import '../../core/widget/text_widgets.dart';
import '../widgets/decorated_container.dart';

class SignUpRegistrationScreen extends ConsumerStatefulWidget {
  static const String routeName = "/SignUpRegistrationScreen";

  const SignUpRegistrationScreen({super.key});

  @override
  ConsumerState<SignUpRegistrationScreen> createState() =>
      _SignUpRegistrationScreenState();
}

class _SignUpRegistrationScreenState
    extends ConsumerState<SignUpRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              text25Heading(text: "Please verify your details,"),
              text14Medium(
                  text:
                      "You can edit any detail that does not tally but this will require you to provide your NIN")
            ],
          ),
          if (loader) buildCustomCircularProgressIndicator(),
        ],
      ),
    );
  }
}
