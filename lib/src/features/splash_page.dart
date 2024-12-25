import 'package:flutter_animate/flutter_animate.dart';
import '../core/core.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      final context = getIt<AppRouter>().navigatorKey.currentState!.context;
      context.replaceRoute(const LoginRoute());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Introvert Diaries",
              style: AppTextStyles.text20PxMedium,
            ),
            // Container(
            //   height: 120,
            //   width: 120,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     // image: DecorationImage(
            //     //   image: Assets.images.logo.provider(),
            //     //   fit: BoxFit.cover,
            //     // ),
            //   ),
            // ).animate().fade(duration: 500.ms),
            20.verticalSpace,
            const CustomCircularProgressIndicator().animate().fade(
                  delay: 500.ms,
                ),
          ],
        ),
      ),
    );
  }
}
