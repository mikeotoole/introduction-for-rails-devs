defmodule Bob do
  @doc """
  Bob is a lackadaisical teenager. In conversation, his responses are very limited.
  Bob answers 'Sure.' if you ask him a question.
  He answers 'Whoa, chill out!' if you yell at him.
  He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
  He says 'Fine. Be that way!' if you address him without actually saying anything.
  He answers 'Whatever.' to anything else.
  """
  def hey(input) do
    cond do
      nothing?(input) -> "Fine. Be that way!"
      shouting_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp shouting_question?(input) do
    question?(input) && yelling?(input)
  end

  defp nothing?(input) do
    String.trim(input) == ""
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp yelling?(input) do
    cond do
      String.replace(input, ~r/[0-9, \?]+/, "") == "" -> false
      input == String.upcase(input) -> true
      true -> false
    end
  end
end
