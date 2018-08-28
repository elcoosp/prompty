import PrefixFormatter

defmodule Prompty do
  @moduledoc """
  Bunch of helpers to prompt questions and print errors in a pretty manner
  """

  @doc """
  Prompt a question message
  ## Examples

      iex> Prompty.prompt_question("How old are you")
      "? How old are you\n"

  """
  def prompt_question(question), do: IO.gets(format_question(question))

  @doc """
  Prompt an error
  ## Examples

      iex> Prompty.print_error("Nice error")
      "X Nice error\n"

  """
  def print_error(error), do: IO.write(:stdio, format_error(error))

  @doc """
  Prompt an info
  ## Examples

      iex> Prompty.print_info("Wonderful info")
      "@info Wonderful info\n"

  """
  def print_info(info), do: IO.write(:stdio, format_info(info))
end

