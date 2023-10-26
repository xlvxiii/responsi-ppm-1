import 'package:flutter/material.dart';
import 'package:responsi_ppm_1/bloc/ikan_bloc.dart';
import 'package:responsi_ppm_1/detail_ikan.dart';
import 'package:responsi_ppm_1/form_ikan.dart';
import 'package:responsi_ppm_1/model/ikan.dart';

class IkanPage extends StatefulWidget {
  const IkanPage({Key? key}) : super(key: key);

  @override
  _IkanPageState createState() => _IkanPageState();
}

class _IkanPageState extends State<IkanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Ikan'),
        actions: [Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormIkan()));
                },
              )),],
      ),
      body: FutureBuilder<List>(
            future: IkanBloc.getIkans(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListIkan(
                      list: snapshot.data,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
    );
  }
}

class ListIkan extends StatelessWidget { 
  final List? list;

  const ListIkan({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemIkan(
            ikan: list![i],
          );
        });
  }
}

class ItemIkan extends StatelessWidget {
  final Ikan ikan;

  const ItemIkan({Key? key, required this.ikan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailIkan(
                      ikan: ikan,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(ikan.nama!),
          subtitle: Column(
            children: [
              Text(ikan.warna!),
              Text(ikan.jenis!),
              Text(ikan.habitat!),
            ],
          ),
        ),
      ),
    );
  }
}
