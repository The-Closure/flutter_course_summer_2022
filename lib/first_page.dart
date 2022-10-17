import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FirstPageBody(),
    );
  }
}

class FirstPageBody extends StatelessWidget {
  const FirstPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Alert Dialog'),
            onPressed: () async {
              String? res = await showDialog<String>(
                  context: context,
                  builder: (ctxt) => AlertDialog(
                        title: Text('Reset settings?'),
                        content: Text(
                            'This will reset your device to its default factory settings.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop('cancel clicked');
                            },
                            child: Text('CANCEL'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop('accept clicked');
                            },
                            child: Text('ACCEPT'),
                          ),
                        ],
                      ));
              print(res);
            },
          ),
          ElevatedButton(
            child: Text('Simple Dialog'),
            onPressed: () async {
              String? res = await showDialog<String>(
                  context: context,
                  builder: (ctxt) => SimpleDialog(
                        title: Text('Reset settings?'),
                        children: [
                          SimpleDialogItem(
                            icon: Icons.account_circle,
                            color: Colors.orange,
                            text: 'user01@gmail.com',
                            onPressed: () {
                              Navigator.pop(context, 'user01@gmail.com');
                            },
                          ),
                          SimpleDialogItem(
                            icon: Icons.account_circle,
                            color: Colors.green,
                            text: 'user02@gmail.com',
                            onPressed: () {
                              Navigator.pop(context, 'user02@gmail.com');
                            },
                          ),
                          SimpleDialogItem(
                            icon: Icons.add_circle,
                            color: Colors.grey,
                            text: 'Add account',
                            onPressed: () {
                              Navigator.pop(context, 'user02@gmail.com');
                            },
                          ),
                        ],
                      ));
              print(res);
            },
          ),
          ElevatedButton(
            child: Text('bottomsheet'),
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  final theme = Theme.of(context);
                  // Using Wrap makes the bottom sheet height the height of the content.
                  // Otherwise, the height will be half the height of the screen.
                  return Wrap(
                    children: [
                      ListTile(
                        title: Text(
                          'Header',
                        ),
                        tileColor: theme.colorScheme.primary,
                      ),
                      ListTile(
                        title: Text('Title 1'),
                      ),
                      ListTile(
                        title: Text('Title 2'),
                      ),
                      ListTile(
                        title: Text('Title 3'),
                      ),
                      ListTile(
                        title: Text('Title 4'),
                      ),
                      ListTile(
                        title: Text('Title 5'),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem(
      {Key? key, this.icon, this.color, this.text, this.onPressed})
      : super(key: key);

  final IconData? icon;
  final Color? color;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text ?? ''),
          ),
        ],
      ),
    );
  }
}
