import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants.dart';


class SearchFieldWidget extends StatefulWidget {
  SearchFieldWidget({
    Key? key,
    required this.padding,
  }) : super(key: key);
  final EdgeInsetsGeometry padding;

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset(
              Constants.kIconSearch,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                ),
                onSubmitted: (value) {
                
                  setState(() {});

                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset(Constants.kIconMic),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
