defmodule Dictionary do
  alias Dictionary.WordList

  defdelegate start, to: WordList, as: :list
  defdelegate random_word(words), to: WordList
end
