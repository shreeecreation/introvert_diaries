import 'package:introvertdiaries/src/core/core.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Introvert Diariess", style: AppTextStyles.text20PxMedium,),
            20.verticalSpace,
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}