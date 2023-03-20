defmodule Cards do
  def create_deck do
    values = ["ace" , "two" , "three" , "four" , "five" , "six" , "seven" , "eight" , "nine" , "ten" , "joker" , "queen" , "king"]
    suits = ["spades" , "clubs" , "diamond" ,"heart"]

      for suit <- suits , value  <- values do
        "#{value} of #{suit}"
      end
  end

  def shuffle_cards(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck , card) do
    Enum.member?(deck , card)
  end

  def deal(deck , hand_size) do
    Enum.split(deck , hand_size)
  end

  def save(deck , filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename , binary)
  end

  def load(filename) do
    {status , binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term binary
      :error -> "this file does not exist"

    end
  end
end

