import 'package:flutter/material.dart';
import 'package:responsi_ppm_1/bloc/ikan_bloc.dart';
import 'package:responsi_ppm_1/dialog%20widget/warning_dialog.dart';
import 'package:responsi_ppm_1/ikan_page.dart';
import 'package:responsi_ppm_1/model/ikan.dart';

class FormIkan extends StatefulWidget {
  Ikan? ikan;

  FormIkan({Key? key, this.ikan}) : super(key: key);

  @override
  _FormIkanState createState() => _FormIkanState();
}

class _FormIkanState extends State<FormIkan> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Ikan";
  String tombolSubmit = "Simpan";

  final _namaTextboxController = TextEditingController();
  final _jenisTextboxController = TextEditingController();
  final _warnaTextboxController = TextEditingController();
  final _habitatTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.ikan != null) {
      setState(() {
        judul = "Edit Ikan";
        tombolSubmit = "Edit";
        _namaTextboxController.text = widget.ikan!.nama!;
        _jenisTextboxController.text = widget.ikan!.jenis!;
        _warnaTextboxController.text = widget.ikan!.warna!;
        _habitatTextboxController.text = widget.ikan!.habitat!;
      });
    } else {
      judul = "Tambah Ikan";
      tombolSubmit = "Simpan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _namaTextField(),
                _jenisTextField(),
                _warnaTextField(),
                _habitatTextField(),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama ikan"),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama harus diisi";
        }
        return null;
      },
    );
  }

  Widget _jenisTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Jenis ikan"),
      keyboardType: TextInputType.text,
      controller: _jenisTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Jenis harus diisi";
        }
        return null;
      },
    );
  }

  Widget _warnaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Warna ikan"),
      keyboardType: TextInputType.text,
      controller: _warnaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Warna harus diisi";
        }
        return null;
      },
    );
  }

  Widget _habitatTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Habitat ikan"),
      keyboardType: TextInputType.text,
      controller: _habitatTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Habitat harus diisi";
        }
        return null;
      },
    );
  }

  Widget _submitButton() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.ikan != null) {
                //kondisi update produk
                ubah();
              } else {
                //kondisi tambah produk
                simpan();
              }
            }
          }
        });
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Ikan createIkan = Ikan(id: null);
    createIkan.nama = _namaTextboxController.text;
    createIkan.jenis = _jenisTextboxController.text;
    createIkan.warna = _warnaTextboxController.text;
    createIkan.habitat = _habitatTextboxController.text;
    IkanBloc.addIkan(ikan: createIkan).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const IkanPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Ikan updateIkan = Ikan(id: null);
    updateIkan.id = widget.ikan!.id;
    updateIkan.nama = _namaTextboxController.text;
    updateIkan.jenis = _jenisTextboxController.text;
    updateIkan.warna = _warnaTextboxController.text;
    IkanBloc.updateIkan(ikan: updateIkan).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const IkanPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
