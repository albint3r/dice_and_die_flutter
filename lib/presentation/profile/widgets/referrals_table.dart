import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/profile/profile_bloc.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class ReferralsTable extends StatelessWidget {
  const ReferralsTable();

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileBloc>().state;
    final referrals = profile.referrals;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: waitingRoomCardWidth,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: TitleH1(text: 'Referrals information'),
          ),
          Divider(color: colorScheme.onBackground),
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
                            referral.totalDeposits.toString(),
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
