import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldcup2022vote/models/worlcup_model.dart';


class WorldCupCardState extends StatelessWidget {
  final WorldCup worldcup;
  WorldCupCardState({required this.worldcup });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.person),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('nation ${worldcup.team}'),
                    Text('Group ${worldcup.group}'),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Vote'))
            ],
          )),
    );
  }
}
