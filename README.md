# Bitcoin max supply simulation

This code simulates when the max supply of Bitcoin will happen and how many bitcoins can be mined by the network.
It is important to know that due to some bugs in some bitcoin clients, there were some blocks generated with a subsidy less than the expected, which will cause a even lower number of bitcoin mined ([read this post to have more details on that](https://amberdata.io/blog/why-the-bitcoin-supply-will-never-reach-21-million/)).

The code of this package uses the same rules implemented in the [Bitcoin Core][core] but rewritten in dart to facilitare the simulation. It also includes a customized implementation that would avoid this bug.

The classes on the `lib` folder tries to mimic the same structure of the [Bitcoin Core][core] implementation to make it easier to find the same files in the [Bitcoin Core repository][core].
All the files and functions in the `lib` folder contains the original documentation and links to the [Bitcoin Core][core] implementation.

There is also a [gist](https://gist.github.com/vital-edu/3099119f8c847c396dbfe2bc08bc7dfe) created based on this repository and its corresponding [DartPad](https://dartpad.dev/?id=3099119f8c847c396dbfe2bc08bc7dfe&null_safety=true).

## Requisites

- Dart >=2.14.2 <3.0.0

## Instructions

After download the code, run in the main project folder:

```bash
# to run simulation using the rules implemented in the Bitcoin Core
dart bin/bitcoin_simulation.dart
# to run simulation using modified rules that would allow exactly 21 million bitcoins be mined
dart bin/bitcoin_simulation.dart
```

This code is suited for education purpose only.

[core]: https://github.com/bitcoin/bitcoin
