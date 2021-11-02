import 'package:intl/intl.dart';

typedef CAmount = int;
const COIN = 100000000;
const CAmount MAX_MONEY = 21000000 * COIN;

int main() {
  int satoshis = 0;
  int blocksMined = 0;
  const ConsensusParams consensusParams = ConsensusParams();

  while (satoshis <= MAX_MONEY) {
    CAmount subsidy = getBlockSubsidy(blocksMined, consensusParams);
    if (subsidy == 0) break;
    satoshis += (subsidy * consensusParams.nSubsidyHalvingInterval);
    blocksMined += consensusParams.nSubsidyHalvingInterval;
  }

  print('Last block with subsidy: $blocksMined');

  final lastBlockWithSubsidyMinedAt =
      calcApproximateYearOfMinedBlock(blocksMined);
  print('Last block with subsidy mined on: $lastBlockWithSubsidyMinedAt');

  final btc = satoshis / COIN;
  print('Max quantity of BTC: ${btc.toStringAsFixed(8)}');

  return 0;
}

int calcApproximateYearOfMinedBlock(int blocksMined) {
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

CAmount getBlockSubsidy(int nHeight, ConsensusParams consensusParams) {
  int halvings = nHeight ~/ consensusParams.nSubsidyHalvingInterval;
  // Force block reward to zero when right shift is undefined.
  if (halvings >= 64) return 0;

  CAmount nSubsidy = 50 * COIN;
  // Subsidy is cut in half every 210,000 blocks which will occur approximately every 4 years.
  nSubsidy >>= halvings;
  return nSubsidy;
}

class ConsensusParams {
  final int nSubsidyHalvingInterval = 210000;

  const ConsensusParams();
}
