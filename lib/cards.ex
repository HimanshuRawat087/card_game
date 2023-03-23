defmodule Cards do
  @moduledoc """
    Card module provides differrent methods for creating and handling a deck of cards
  """

  @doc """
    This function creates and returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["ace" , "two" , "three" , "four" , "five" , "six" , "seven" , "eight" , "nine" , "ten" , "joker" , "queen" , "king"]
    suits = ["spades" , "clubs" , "diamond" ,"heart"]

      for suit <- suits , value  <- values do
        "#{value} of #{suit}"
      end
  end

  @doc """
    This function shuffles the given `card` and returns a new list of string representing the deck of shuffled cards
  """
  def shuffle_cards(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    This function takes the card name as an argument `card` and checks the availability of the card in the given deck  and returns the boolean value
    representing the availability of the card using `Enum.member?/2`
  """
  def contains?(deck , card) do
    Enum.member?(deck , card)
  end

  @doc """
  This function divides the `deck` into a hand and the remainder of the deck in the form of `tuple` and then only returns the first element of that tuple
  ie. list of string representing the number of cards mentioned in the `hand_size`  
  The `hand_size` argument indicates how many cards should be in a hand.

  ## Example 

       iex> deck = Cards.create_deck 
       iex> Cards.deal(deck , 10)
       ["ace of spades", "two of spades", "three of spades", "four of spades",
       "five of spades", "six of spades", "seven of spades", "eight of spades",
       "nine of spades", "ten of spades"]

  """
  def deal(deck , hand_size) do
    Enum.split(deck , hand_size)
    |> elem(0)
   
  end

  @doc """
  save funtion saves the list of given deck in a new file after converting the content in the binary form , 
  here, `filename` argument indicates the name of the file
  """
  def save(deck , filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename , binary)
  end

 @doc """
  load function with the argument `filename` loads the content of the file after converting it from binary to text if the file is present
  else returns a message `"this file doesnot exist."`
 """
  def load(filename) do

    case File.read(filename) do
      {:ok , binary } -> :erlang.binary_to_term binary
      {:error , _reason } -> "this file does not exist"
    end
  end

 @doc """ 
  create hand function calls other function to create a deck then shuffles it and then create a `deal` .
  `hand_size`argument indicates how many cards should be in a hand.
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle_cards()
    |> deal(hand_size)
  end
end

