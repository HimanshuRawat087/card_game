defmodule Cards do
  def create_deck do
    values = ["ace" , "two" , "three" , "four" , "five" , "six" , "seven" , "eight" , "nine" , "ten" , "joker" , "queen" , "king"]
    suits = ["spades" , "clubs" , "diamond" ,"heart"]

    total_cards = for suit  <- suits do 
      for value  <- values do 
        "#{value} of #{suit}"
      end
    end
    
    List.flatten(total_cards)
  end

  def shuffle_cards(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck , card) do 
    Enum.member?(deck , card)
  end
end

