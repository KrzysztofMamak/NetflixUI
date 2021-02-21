import 'package:flutter/material.dart';
import 'package:netflix_ui/assets.dart';
import 'package:netflix_ui/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _AppBarButton(
                  title: 'Home',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'Latest',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
                _AppBarButton(
                  title: 'KIDS',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'DVD',
                  onTap: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
