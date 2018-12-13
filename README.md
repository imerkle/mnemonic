# Mnemonic

[![Build Status](https://travis-ci.com/imerkle/mnemonic.svg?branch=master)](https://travis-ci.com/imerkle/mnemonic)

Library for generating deterministic private keys from random words according to BIP39 standard:

```elixir
  Mnemonic.generate()
  # "obscure appear begin host burden uncle glow tell journey autumn burden welcome"
  words = Mnemonic.generate()
  # "pretty element obey slab way middle brisk glory stone material hungry guess"
  key = Mnemonic.mnemonic_to_entropy(words)
  # AA28F65FE57F811887131CD6511DBD33

  mnemonic = Mnemonic.entropy_to_mnemonic("00000000000000000000000000000000")
  # "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
  Mnemonic.mnemonic_to_entropy(mnemonic)
  # "00000000000000000000000000000000"
  Mnemonic.mnemonic_to_seed(mnemonic, password)
  # 2e8905819b.....9739fce1f607

```

TODO:
- add documentation

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mnemonic` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mnemonic, git: "https://github.com/imerkle/mnemonic.git"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mnemonic](https://hexdocs.pm/mnemonic).
