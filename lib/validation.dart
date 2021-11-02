/// This file contains fragments of the source code of the Bitcoin Core rewritten with dart-lang.
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/816e15ee81a2029cde6b4f9fe6fb93e75478c903/src/consensus/amount.h)

import 'consensus/amount.dart';
import 'consensus/params.dart';

/// Function defined on Bitcoin Core rewritten with dart-lang.
///
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/1847ce2d49e13f76824bb6b52985e8ef5fbcd1db/src/validation.cpp#L1068-L1079):
/// ```cpp
/// CAmount GetBlockSubsidy(int nHeight, const Consensus::Params& consensusParams)
/// {
///     int halvings = nHeight / consensusParams.nSubsidyHalvingInterval;
///     // Force block reward to zero when right shift is undefined.
///     if (halvings >= 64)
///         return 0;
///
///     CAmount nSubsidy = 50 * COIN;
///     // Subsidy is cut in half every 210,000 blocks which will occur approximately every 4 years.
///     nSubsidy >>= halvings;
///     return nSubsidy;
/// }
/// ```
CAmount getBlockSubsidy(int nHeight, Params consensusParams) {
  int halvings = nHeight ~/ consensusParams.nSubsidyHalvingInterval;
  // Force block reward to zero when right shift is undefined.
  if (halvings >= 64) return CAmount.zero;

  CAmount nSubsidy = CAmount.from(50) * COIN;
  // Subsidy is cut in half every 210,000 blocks which will occur approximately every 4 years.
  nSubsidy >>= halvings;
  return nSubsidy;
}
