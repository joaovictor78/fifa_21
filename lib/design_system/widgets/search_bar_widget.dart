import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_palettes.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatefulWidget {
  void Function(String) onChanged;
  String hintText;
  // ignore: use_key_in_widget_constructors
  SearchBarWidget(
      {required this.onChanged, this.hintText = "Search for a player..."});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        style: GoogleFonts.poppins(color: Colors.black),
        onChanged: widget.onChanged,
        autofocus: false,
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: BorderSide.none,
            ),
            fillColor: ColorPalettes.accentPrimary.withOpacity(0.1),
            filled: true,
            hintStyle: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.5), fontSize: 12),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
            )),
      ),
    );
  }
}
