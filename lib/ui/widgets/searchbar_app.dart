import 'dart:async';

import 'package:catopia/domain/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  Timer? _debounce;

  void _onSearchChanged(String query, {bool isDebounce = true}) {
    setState(() {});
    if (isDebounce) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        context.read<HomeBloc>().add(SearchCatBreedEv(query));
      });
    } else {
      context.read<HomeBloc>().add(SearchCatBreedEv(query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        controller: _controller,

        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _controller.clear();
                    context.read<HomeBloc>().add(InitEvent());
                  },
                )
              : null,
        ),
        onChanged: _onSearchChanged,
        onSubmitted: (value) {
          _onSearchChanged(value, isDebounce: false);
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
