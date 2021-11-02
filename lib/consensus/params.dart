/// This file contains fragments of the source code of the Bitcoin Core rewritten with dart-lang.
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/7fcf53f7b4524572d1d0c9a5fdc388e87eb02416/src/consensus/params.h)

/// Parameters that influence chain consensus.
/// ---
/// Only the param `nSubsidyHalvingInterval` was keep.
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/7fcf53f7b4524572d1d0c9a5fdc388e87eb02416/src/consensus/params.h#L46-L93)
class Params {
  /// ---
  /// This is used to determine when the halving will happen.
  /// Every `nSubsidyHalvingInterval` block mined, happens a new halving.
  /// [See original implementation](https://github.com/bitcoin/bitcoin/blob/7fcf53f7b4524572d1d0c9a5fdc388e87eb02416/src/consensus/params.h#L48)
  final int nSubsidyHalvingInterval;

  const Params(this.nSubsidyHalvingInterval);
}
