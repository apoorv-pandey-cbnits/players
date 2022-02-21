import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/network_image.dart';

import '../../services/helpers.dart';

class Player extends StatelessWidget {
  final String playerName;
  final String imageUrl;
  final String? end;
  final int ranking;

  const Player(this.playerName, this.imageUrl, this.end, this.ranking,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        elevation: 4.0,
        shadowColor: Colors.blueGrey,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          leading:
              SizedBox(height: 64, width: 64, child: ImageNetwork(imageUrl)),
          title: Text(playerName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(
            'Since: $end',
            style: const TextStyle(color: Colors.black45),
          ),
          trailing: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              border: Border.all(width: 1.6, color: Colors.black45),
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Align(
              child: Text(
                '$ranking' + ordinal(ranking),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xff2EB395)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
