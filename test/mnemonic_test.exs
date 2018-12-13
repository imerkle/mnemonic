defmodule MnemonicTest do
  use ExUnit.Case
  # doctest Mnemonic
  @vectors Fixtures.Vectors.all() |> Map.get(:english)

  test "vectors example word for the library" do
    @vectors |> Enum.each(fn(vector) ->
      target_entropy = List.first(vector)
      target_mnemonic = Enum.at(vector, 1)
      target_seed = Enum.at(vector, 2)
      assert Mnemonic.entropy_to_mnemonic(target_entropy) == target_mnemonic
      assert Mnemonic.mnemonic_to_entropy(target_mnemonic) |> String.downcase == target_entropy
      assert Mnemonic.mnemonic_to_seed(target_mnemonic, "TREZOR") == target_seed
      assert Mnemonic.validate_mnemonic(target_mnemonic) == true
    end)
  end

  test "invalid mnemonic returns false" do
    assert Mnemonic.validate_mnemonic("subscribe to pewdiepie") == false
  end

  test "entropy_to_mnemonic works" do
    entropy = "00000000000000000000000000000000"
    mnemonic = Mnemonic.entropy_to_mnemonic(entropy)
    assert mnemonic == "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
    assert Mnemonic.mnemonic_to_entropy(mnemonic) == entropy
  end

  test "can create and recover mnemonic private keys" do
    1..10000 |> Enum.reduce([], fn(x, acc) ->
      mnemonic = Mnemonic.generate()
      if Enum.member?(acc, mnemonic) do
        raise "Duplicate mnemonic found #{mnemonic}"
      end

      private_key = Mnemonic.mnemonic_to_entropy(mnemonic)
      assert Mnemonic.entropy_to_mnemonic(private_key) == mnemonic

      [mnemonic | acc]
    end)
  end
  test "generate can vary entropy length" do
      l = 
      Mnemonic.generate(160)
      |> String.split()
      |> length()

      assert l == 15
  end
  # also test that word count is 2048 bits(?)
end

