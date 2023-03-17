defmodule Cards do
  def create_deck do
    ["ace" , "two" , "three"]
  end

  def shuffle_cards(deck) do
    Enum.shuffle(deck)
  end

  def open_deck(deck) do 
    deck
  end
end

