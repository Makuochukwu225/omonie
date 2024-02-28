import 'package:omonie/src/src.dart';

class BuildPostList extends StatelessWidget {
  const BuildPostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, provider, _) {
      var list = provider.list;
      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BuildPostItem(data: list[index]),
          separatorBuilder: (context, index) => verticalGap(),
          itemCount: list.length);
    });
  }
}
