import 'package:introvertdiaries/src/core/core.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWrapper(body: Center(child: Text("Home Page"),),);
  }
}