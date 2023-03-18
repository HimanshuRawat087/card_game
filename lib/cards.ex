defmodule Cards do
  def create_deck do
    values = ["ace" , "two" , "three" , "four" , "five" , "six" , "seven" , "eight" , "nine" , "ten" , "joker" , "queen"]
    suits = ["spades" , "clubs" , "diamond" ,"heart"]

      for value  <- values , suit <- suits do 
        "#{value} of #{suit}"
      end
  end 

  def shuffle_cards(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck , card) do 
    Enum.member?(deck , card)
  end
end

