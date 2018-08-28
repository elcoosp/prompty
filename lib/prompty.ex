import PrefixFormatter

defmodule Prompty do
  @moduledoc """
  Bunch of helpers to prompt questions and print infos and errors in a pretty fahsion
  """

  @doc """
  Prompt a question and return the user input
  ## Examples

      iex> Prompty.prompt("How old are you")
      "? How old are you"

  """
  def prompt(question), do: IO.gets(format_question(question))

  @doc """
  Prompt an error
  ## Examples

      iex> Prompty.print_error("Nice error")
      "X Nice error"

  """
  def print_error(error), do: IO.write(:stdio, format_error(error))

  @doc """
  Prompt an info
  ## Examples

      iex> Prompty.print_info("Wonderful info")
      "@info Wonderful info"

  """
  def print_info(info), do: IO.write(:stdio, format_info(info))
end
