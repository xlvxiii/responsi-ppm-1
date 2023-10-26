import 'package:flutter/material.dart';
import 'package:responsi_ppm_1/form_ikan.dart';
import 'package:responsi_ppm_1/model/ikan.dart';

class DetailIkan extends StatefulWidget {
  Ikan? ikan;
  DetailIkan({Key? key, this.ikan}) : super(key: key);

  @override
  _DetailIkanState createState() => _DetailIkanState();
}

class _DetailIkanState extends State<DetailIkan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Ikan'),
      ),
      body: Column(
        children: [
          Text('Nama : ${widget.ikan!.nama}'),
          Text('Nama : ${widget.ikan!.jenis}'),
          Text('Nama : ${widget.ikan!.warna}'),
          Text('Nama : ${widget.ikan!.habitat}'),
          _tombolHapusEdit()
        ],
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      //Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormIkan(
                            ikan: widget.ikan!,
                          )));
            }),
//Tombol Hapus
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormIkan(
                          ikan: widget.ikan!,
                        )));
          },
        ),
//tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
