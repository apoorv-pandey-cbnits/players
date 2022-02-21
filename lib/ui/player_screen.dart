import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/players_provider.dart';
import 'package:untitled/ui/widgets/player_item.dart';

class PlayersListScreen extends StatefulWidget {
  const PlayersListScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PlayersListScreenState createState() => _PlayersListScreenState();
}

class _PlayersListScreenState extends State<PlayersListScreen> {
  late PlayersProvider playersProvider;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await playersProvider.getFilters();
      if (playersProvider.filterDates!.isNotEmpty) {
        playersProvider.getPlayers(playersProvider.filterDates![0].id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    playersProvider = Provider.of<PlayersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          IconButton(
            onPressed: () => _showListOfFilters(),
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
        bottom: PreferredSize(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Search here",
                    prefixIcon: Icon(Icons.search, color: Colors.black87),
                  ),
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(64.0)),
      ),
      body: Column(
        children: [
          Expanded(
            child: playersProvider.players!.isNotEmpty
                ? _buildList()
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: playersProvider.players!.length,
        itemBuilder: (context, index) {
          final playerName = playersProvider.players![index].userUsername!;
          final imageUrl = playersProvider.players![index].imageUrl!;
          final ranking = playersProvider.players![index].ranking!;
          return Player(playerName, imageUrl, playersProvider.end, ranking);
        });
  }

  _showListOfFilters() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Filter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: playersProvider.filterDates!.length,
                      itemBuilder: (context, index) {
                        final date = playersProvider.filterDates![index].date!;
                        final filterId =
                            playersProvider.filterDates![index].id!;
                        return ListTile(
                          onTap: () => playersProvider.getPlayers(filterId),
                          title: Text(date),
                        );
                      }),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
