import 'package:flutter/material.dart';
import 'package:uesc_hub/app/shared/functions/generation_color.dart';

class SubjectsListWidget extends StatelessWidget {
  final List list;

  SubjectsListWidget({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (_, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(list[index].subject),
              leading: Container(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 5,
                      color: GenerationColor(seed: list[index].id)
                          .colorSubject(),
                    ),
                    Text(list[index].id),
                  ],
                ),
              ),
              subtitle: Text(list[index].classTheoreticalLocation +
                  '\n' +
                  list[index].classPracticeLocation),
              trailing: Text(list[index].classTheoretical +
                  '\n' +
                  list[index].classPractice),
            ),
          ],
        );
      },
    );
  }
}
