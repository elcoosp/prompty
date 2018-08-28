defmodule Prompty do
  @moduledoc """
  Make prompting for inputs friendlier
  """

  @doc """
  Print a question with a nice formatting and return the user input

  ## Examples

      iex> Prompty.prompt("How old are you")
      ? How old are you # Now wait for user input

  """
  def prompt(question, prefix \\ "?") do
    IO.gets(
      ~s/#{IO.ANSI.bright()}#{IO.ANSI.green()}#{prefix}#{IO.ANSI.white()} #{question}#{
        IO.ANSI.normal()
      }\n/
    )
  end
end
