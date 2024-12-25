import 'package:flutter/services.dart';
import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/auth.dart';

@RoutePage<void>()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _countryCodeController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    _countryCodeController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => getIt<LoginCubit>(),
        ),
        BlocProvider<PhoneNumberCubit>(
          create: (_) => getIt<PhoneNumberCubit>(),
        ),
         BlocProvider<CountryInfoCubit>(
          create: (_) => getIt<CountryInfoCubit>()..initialize(),
        ),
      ],
      child: BlocProvider.value(
        value: context.read<CountryInfoCubit>()..initialize(),
        child: Builder(builder: (context) {
          return ScaffoldWrapper(
            appBar: AppBar(
              toolbarHeight: 50,
            ),
            body: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    context.showSnackbar( message: message, error: true);
                  },
                  success: (message) {
                    context.showSnackbar(message: message, error: false);
                    // context.pushRoute(ConfirmOtpRoute(
                    //     countryCode: _countryCodeController.text,
                    //     phoneNumber: _phoneNumberController.text,
                    //     appSignature: BlocProvider.of<PhoneNumberCubit>(context).appSignature));
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Login  ',
                        style: AppTextStyles.text20PxMedium,
                      ),
                      20.verticalSpace,
                      SizedBox(
                        width: context.width,
                        // height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocListener<CountryInfoCubit, CountryInfoState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  initial: () {},
                                  orElse: () => context.read<CountryInfoCubit>().selectUserCountryCode(),
                                  success: (countryInfo, selectedCountry) {
                                    if (selectedCountry != null) {
                                      final countryCode = selectedCountry;
                                      context.read<PhoneNumberCubit>().selectCountryCode(countryCode);
                                      _countryCodeController.text = countryCode.dialCode;
                                    }
                                  },
                                );
                              },
                              child: CountryCode(
                                selectedCountry: context.select((PhoneNumberCubit bloc) => bloc.state.countryCodeField.value),
                                controller: _countryCodeController,
                                onChanged: (value) {
                                  context.read<PhoneNumberCubit>().selectCountryCode(value);
                                  _countryCodeController.text = value.dialCode;
                                },
                              ),
                            ),
                            Expanded(
                              child: _PhoneNumberField(
                                phoneNumberController: _phoneNumberController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      5.verticalSpace,
                      const Text("We'll call or text you to confirm your number."),
                      30.verticalSpace,
                      BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
                        builder: (context, state) {
                          final loading = context.select<LoginCubit, bool>(
                            (value) => value.state.maybeWhen(
                              orElse: () => false,
                              loading: () => true,
                            ),
                          );
                          return CustomButton(
                            onPressed: () => {
                              context.read<LoginCubit>().login(state.values),
                            },
                            isDisabled: !state.isValid,
                            loading: loading,
                            label: 'Continue',
                            fullWidth: true,
                          );
                        },
                      ),
                      30.verticalSpace,
                      // Row(
                      //   children: [
                      //     const Expanded(child: SizedBox(child: Divider())),
                      //     10.horizontalSpace,
                      //     Text('OR', style: AppStyles.text14Px),
                      //     10.horizontalSpace,
                      //     const Expanded(child: SizedBox(child: Divider())),
                      //   ],
                      // ),
                      // 30.verticalSpace,
                      // Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(),
                      //       borderRadius: const BorderRadius.all(
                      //         Radius.circular(8),
                      //       )),
                      //   child: CustomButton.icon(
                      //     backgroundColor: AppColors.transparent,
                      //     label: 'Continue with Facebook',
                      //     textColor: AppColors.black,
                      //     isDisabled: false,
                      //     gap: 40,
                      //     icon: Image.asset(
                      //       'assets/images/facebook.png',
                      //       scale: 1.5,
                      //     ),
                      //     onPressed: () => context.read<FacebookRegisterCubit>().signIn(errorMessage: 'errorMessage'),
                      //   ),
                      // ),
                      // 10.verticalSpace,
                      // Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(),
                      //       borderRadius: const BorderRadius.all(
                      //         Radius.circular(8),
                      //       )),
                      //   child: CustomButton.icon(
                      //     backgroundColor: AppColors.transparent,
                      //     label: 'Continue with Google',
                      //     textColor: AppColors.black,
                      //     isDisabled: false,
                      //     gap: 40,
                      //     icon: Assets.icons.googleIcon.svg(),
                      //     onPressed: () => context.read<GoogleRegisterCubit>().signIn(errorMessage: 'errorMessage'),
                      //   ),
                      // ),
                      // 10.verticalSpace,
                      // Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(),
                      //       borderRadius: const BorderRadius.all(
                      //         Radius.circular(8),
                      //       )),
                      //   child: CustomButton.icon(
                      //     backgroundColor: AppColors.transparent,
                      //     label: 'Continue with Apple',
                      //     textColor: AppColors.black,
                      //     isDisabled: false,
                      //     gap: 40,
                      //     icon: Image.asset(
                      //       'assets/images/apple.png',
                      //       scale: 1.5,
                      //     ),
                      //     onPressed: () {},
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _PhoneNumberField extends StatelessWidget {
  _PhoneNumberField({required this.phoneNumberController});
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
      buildWhen: (previous, current) => current.numberField != previous.numberField,
      builder: (context, state) {
        return Container(
          child: CustomTextField(
            controller: phoneNumberController,
            hintText: "Phone Number",
            inputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            inputAction: TextInputAction.next,
            onChanged: context.read<PhoneNumberCubit>().onNumberChange,
            errorText: context.watch<LoginCubit>().state.maybeWhen(
                  orElse: () => state.numberField.errorMessage,
                  validationError: (message, map) => message,
                ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            suffixIcon: !state.numberField.hasError ? const SizedBox.shrink() : const Icon(Icons.error),
          ),
        );
      },
    );
  }
}
