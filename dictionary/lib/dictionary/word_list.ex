defmodule Dictionary.WordList do
  def list do
    "../../assets/words.txt" 
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

  def random_word(words) do
    Enum.random(words)
  end
end
