import 'dart:math';

import 'package:bitcoin_simulation/chain_params.dart';
import 'package:bitcoin_simulation/consensus/params.dart';
import 'package:intl/intl.dart';
import 'package:bitcoin_simulation/validation.dart';
import 'package:bitcoin_simulation/consensus/amount.dart';

typedef BlockSubsidyFunction = CAmount Function(int, Params);

/// This programm will simulate the max number of bitcoin that will be mined
/// by the Bitcoin Network.
///
/// Excute with `new` as the first argument to run the a modified algorithm that
/// would produce exactly 21 millions of satoshis:
/// ```shell
/// dart bin/bitcoin_simulation.dart new
/// ```
///
/// Without any args, it will be executed the simulation based on the current
/// Bitcoin Core implementation, which will mine 20999999.97690000 bitcoins
/// or less:
/// ```shell
/// dart bin/bitcoin_simulation.dart
/// ```
int main(List<String> args) {
  BlockSubsidyFunction blockSubsidy = args.isNotEmpty && args.first == 'new'
      ? modifiedGetBlockSubsidy
      : getBlockSubsidy;

  CAmount satoshis = CAmount.zero;
  int blocksMined = 0;
  final Params consensusParams = CMainParams().consensus;

  while (satoshis < MAX_MONEY) {
    CAmount subsidy = blockSubsidy(blocksMined, consensusParams);

    if (subsidy == CAmount.zero) break;
    satoshis +=
        (subsidy * CAmount.from(consensusParams.nSubsidyHalvingInterval));
    blocksMined += consensusParams.nSubsidyHalvingInterval;
  }

  final btc = satoshis / COIN;
  final maxHalvings = blocksMined ~/ consensusParams.nSubsidyHalvingInterval;
  final lastSubsidizedBlockMinedAt = approximateYearOfMinedBlock(blocksMined);

  print('First block without subsidy: $blocksMined');
  print('Last subsidized block mined on the year: $lastSubsidizedBlockMinedAt');
  print('Max quantity of satoshis to be created: ${satoshis.toInt()}');
  print('Max quantity of BTC to be created: ${btc.toStringAsFixed(8)}');
  print('Max quantity of halvings that will happen: $maxHalvings');

  return 0;
}

int approximateYearOfMinedBlock(int blocksMined) {
  const firstBlockDate = "January 09, 2009 02:54 AM UTC";
  const dateFormat = "MMMM d, yyyy hh:mm a UTC";
  const approximateMinutesToMineBlock = 10;

  final firstBlockMiningDate =
      DateFormat(dateFormat).parse(firstBlockDate, true);
  final blockMinedDate = firstBlockMiningDate.add(
    Duration(minutes: approximateMinutesToMineBlock * blocksMined),
  );
  return blockMinedDate.year;
}

CAmount modifiedGetBlockSubsidy(int nHeight, Params consensusParams) {
  int halvings = nHeight ~/ consensusParams.nSubsidyHalvingInterval;
  // Force block reward to zero when right shift is undefined.
  if (halvings >= 64) return CAmount.zero;

  double nSubsidy = 50.0 * COIN.toInt();
  // Subsidy is cut in half every 210,000 blocks which will occur approximately every 4 years.
  nSubsidy /= pow(2, halvings);

  return nSubsidy >= 1
      ? CAmount.from(nSubsidy.floor())
      : CAmount.from(nSubsidy.ceil());
}
