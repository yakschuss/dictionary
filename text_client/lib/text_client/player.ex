defmodule TextClient.Player do

  alias TextClient.{ State, Summary, Prompter, Mover }

  def play( %State{ tally: %{ game_state: :won } } ) do
    exit_with_message("You won the game!")
  end

  def play( %State{ tally: %{ game_state: :lost } } ) do
    exit_with_message("You lost the game!")
  end

  def play( game = %State{ tally: %{ game_state: :good_guess } } ) do
    continue_with_message(game, "Good guess!")
  end

  def play( game = %State{ tally: %{ game_state: :bad_guess } } ) do
    continue_with_message(game, "Sorry, that's not in the word.")
  end

  def play( game = %State{ tally: %{ game_state: :already_used } } ) do
    continue_with_message(game, "You've guessed that already!")
  end

  def play(game) do
    continue(game)
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display
    |> Prompter.accept_move
    |> Mover.make_move
    |> play
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end
end
