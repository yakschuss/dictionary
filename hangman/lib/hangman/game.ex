defmodule Hangman.Game do

  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
  )

  def new_game() do
    %Hangman.Game{ letters: letters_to_be_guessed() }
  end

  def make_move(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
    { game, tally(game) }
  end

  def make_move(game = %{ game_state: :lost }, _guess) do
    { game, tally(game) }
  end

  defp tally(game) do
    123
  end

  defp letters_to_be_guessed do
    Dictionary.random_word  |> String.codepoints
  end
end

