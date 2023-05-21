import 'package:kinopoisk_base/movie/movie.dart';
import 'package:flutter/cupertino.dart';

class SearchAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbarWidget({
    super.key,
    required this.onSearch,
    required this.isLoading,
  });

  final ValueChanged<String> onSearch;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).viewPadding.top),
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter movie name',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceVariant,
              contentPadding: EdgeInsets.all(15).copyWith(right: 20),
              suffix: _Preloader(isLoading),
            ),
            onChanged: onSearch,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(83);
}

class _Preloader extends StatelessWidget {
  const _Preloader(this.isLoading);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: Duration(milliseconds: 200),
      curve: Curves.fastEaseInToSlowEaseOut,
      scale: isLoading ? 1 : 0,
      child: SizedBox(
        child: CupertinoActivityIndicator(),
        height: 15,
        width: 15,
      ),
    );
  }
}
