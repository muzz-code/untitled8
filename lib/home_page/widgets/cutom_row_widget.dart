import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/notifier/visibility_notifier.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/images_res.dart';
import '../../core/widget/text_widgets.dart';

class DashboardHeaderWidget extends ConsumerStatefulWidget {
  final List<String>? accountCurrencyType;
  final String? initialDropdownValue;

  const DashboardHeaderWidget({
    super.key,
    this.accountCurrencyType,
    this.initialDropdownValue,
  });

  @override
  ConsumerState createState() => CustomRowWidgetState();
}

class CustomRowWidgetState extends ConsumerState<DashboardHeaderWidget> {
  String? dropdownValue;
  String currencyPrefix = "NGN";

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialDropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    final accountCurrencyType = widget.accountCurrencyType;
    final accountVisibility = ref.watch(visibilityNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text10Bold(text: 'WALLET BALANCE', color: AppColors.whiteColor),
                Row(
                  children: [
                    GestureDetector(
                      child: text24Heading(
                          text: accountVisibility
                              ? "$currencyPrefix*********"
                              : "${currencyPrefix}50,000",
                          requiredPrefixIcon: false,
                          color: Colors.white),
                      onTap: () {
                        ref
                            .read(visibilityNotifierProvider.notifier)
                            .toggleAccountBalanceVisibility();
                      },
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: Icon(
                        accountVisibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: Colors.white,
                      ),
                      onTap: () {
                        ref
                            .read(visibilityNotifierProvider.notifier)
                            .toggleAccountBalanceVisibility();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      // height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: text12Normal(text: "Cashback "),
                          ),
                          text12Normal(
                              text: "N341.20", color: AppColors.danger),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 70,
              width: 2,
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        text10Bold(text: "MONIEPOINT", color: Colors.white),
                      ],
                    ),
                    Row(
                      children: [
                        text24Heading(text: "6272671277", color: Colors.white),
                      ],
                    ),
                    Row(
                      children: [
                        text10Bold(
                            text: "Deposit Fee N20", color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
