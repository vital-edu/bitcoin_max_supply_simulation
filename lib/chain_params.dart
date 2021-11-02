/// This file contains fragments of the source code of the Bitcoin Core rewritten with dart-lang.
/// [See original header definition](https://github.com/bitcoin/bitcoin/blob/feedb9c84e72e4fff489810a2bbeec09bcda5763/src/chainparams.h)
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/feedb9c84e72e4fff489810a2bbeec09bcda5763/src/chainparams.cpp)

import 'consensus/params.dart';

/// CChainParams defines various tweakable parameters of a given instance of the
/// Bitcoin system.
/// ---
/// Only the param `consensus` was keep.
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/7fcf53f7b4524572d1d0c9a5fdc388e87eb02416/src/chainparams.h#L60-L133)
abstract class CChainParams {
  final Params consensus;

  CChainParams({
    required this.consensus,
  });
}

/// Main network on which people trade goods and services.
/// ---
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/feedb9c84e72e4fff489810a2bbeec09bcda5763/src/chainparams.cpp#L58-L175)
class CMainParams implements CChainParams {
  /// ---
  /// The consensus params with the `nSubsidyHalvingInterval` definition.
  /// [See original implementation](https://github.com/bitcoin/bitcoin/blob/feedb9c84e72e4fff489810a2bbeec09bcda5763/src/chainparams.cpp#L67)
  const CMainParams()
      : consensus = const Params(210000),
        super();

  @override
  final Params consensus;
}
