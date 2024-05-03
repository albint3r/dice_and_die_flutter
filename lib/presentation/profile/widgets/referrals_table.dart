import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/profile/profile_bloc.dart';
import '../../../domain/core/extensions.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class ReferralsTable extends StatelessWidget {
  const ReferralsTable();

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileBloc>().state;
    final auth = context.watch<AuthBloc>().state;
    final referrals = profile.referrals;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userId = auth.appUser?.userId ?? '';
    return SizedBox(
      width: waitingRoomCardWidth,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: TitleH1(text: 'Referrals information'),
          ),
          Divider(color: colorScheme.onBackground),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your Code:'),
              Text(
                userId.substring(0, 12),
              ),
              IconButton(
                onPressed: () => FlutterClipboard.copy(userId),
                icon: const Icon(Icons.copy),
              ),
            ],
          ),
          const Gap(padding),
          if (referrals.isNotEmpty)
            DataTable(
              border: TableBorder.all(
                borderRadius: const BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
              ),
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'User',
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Amount',
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Deposits',
                    ),
                  ),
                ),
              ],
              rows: referrals
                  .map(
                    (referral) => DataRow(
                      cells: [
                        DataCell(
                          Center(
                            child: TitleH2(
                              referral.referralCode.substring(0, 4),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: TitleH2(
                              '\$ ${referral.totalRewards}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: TitleH2(
                              referral.totalDeposits.toString().formatToFinancial(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
