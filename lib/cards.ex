defmodule Cards do
  def create_deck do
    ["ace" , "two" , "three"]
  end

  def shuffle_cards(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck , card) do 
    Enum.member?(deck , card)
  end
end

