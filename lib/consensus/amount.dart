/// This file contains fragments of the source code of the Bitcoin Core rewritten with dart-lang.
/// [See original implementation](https://github.com/bitcoin/bitcoin/blob/816e15ee81a2029cde6b4f9fe6fb93e75478c903/src/consensus/amount.h)

// ignore_for_file: constant_identifier_names

/// Amount in satoshis (Can be negative)
/// ---
/// [Original implementation](https://github.com/bitcoin/bitcoin/blob/816e15ee81a2029cde6b4f9fe6fb93e75478c903/src/consensus/amount.h#L11-L12):
/// ```cpp
/// typedef int CAmount;
/// ```
typedef CAmount = int;

/// ---
/// [Original implementation](https://github.com/bitcoin/bitcoin/blob/816e15ee81a2029cde6b4f9fe6fb93e75478c903/src/consensus/amount.h#L14):
/// ```cpp
/// static constexpr CAmount COIN = 100000000;
/// ```
const CAmount COIN = 100000000;

/// No amount larger than this (in satoshi) is valid.
///
/// Note that this constant is *not* the total money supply, which in Bitcoin
/// currently happens to be less than 21,000,000 BTC for various reasons, but
/// rather a sanity check. As this sanity check is used by consensus-critical
/// validation code, the exact value of the MAX_MONEY constant is consensus
/// critical; in unusual circumstances like a(nother) overflow bug that allowed
/// for the creation of coins out of thin air modification could lead to a fork.
/// ---
/// [Original implementation](https://github.com/bitcoin/bitcoin/blob/816e15ee81a2029cde6b4f9fe6fb93e75478c903/src/consensus/amount.h#L16-L25):
/// ```cpp
/// static constexpr CAmount MAX_MONEY = 21000000 * COIN;;
/// ```
const CAmount MAX_MONEY = 21000000 * COIN;
