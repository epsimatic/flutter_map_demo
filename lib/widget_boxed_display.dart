import 'package:flutter/material.dart';

class BoxedDisplay extends StatelessWidget {
  const BoxedDisplay({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onErrorContainer,
    );

    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
