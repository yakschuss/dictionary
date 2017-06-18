defmodule Hangman.Game do

  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
  )

  def new_game() do
    %Hangman.Game{ letters: letters_to_be_guessed() }
  end

  defp letters_to_be_guessed do
    Dictionary.random_word  |> String.codepoints
  end
end

