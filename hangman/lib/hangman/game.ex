defmodule Hangman.Game do

  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new(),
  )

  def new_game() do
    %Hangman.Game{ letters: letters_to_be_guessed() }
  end

  def make_move(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
    { game, tally(game) }
  end

  def make_move(game, guess) do
    game = accept_move(game, guess, MapSet.member?(game.used, guess))
    { game, tally(game) }
  end

  def accept_move(game, guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_used)
  end

  def accept_move(game, guess, _already_guessed = false) do
    Map.put(game, :used, MapSet.put(game.used, guess))
  end

  defp tally(game) do
    123
  end

  defp letters_to_be_guessed do
    Dictionary.random_word  |> String.codepoints
  end
end

