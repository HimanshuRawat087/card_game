defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates 52 cards" do
    assert length(Cards.create_deck) == 52
  end
end
