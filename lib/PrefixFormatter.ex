defmodule PrefixFormatter do
  @moduledoc """
  Prettify question and error message (using a prefix) and some nice colors
  """

  @doc """
  Format a text and prefix to be printed with a line break

  ## Examples

      iex> PrefixFormatter.format("?", "How old are you")
      "? How old are you"
  """
  def format(prefix, text),
    do: ~s/#{IO.ANSI.bright()}#{prefix}#{IO.ANSI.white()} #{text}#{IO.ANSI.normal()}\n/

  @doc """
  Format to a pretty question

  ## Examples

      iex> PrefixFormatter.format_question("How old are you")
      "? How old are you"
  """
  def format_question(message), do: format(IO.ANSI.green() <> "?", message)

  @doc """
  Format to a pretty error

  ## Examples

      iex> PrefixFormatter.format_error("Something is wrong !")
      "X Something is wrong !"
  """
  def format_error(message), do: format(IO.ANSI.red() <> "X", message)

  @doc """
  Format to a pretty info

  ## Examples

      iex> PrefixFormatter.format_info("Something is happening !")
      "@info Something is happening !"
  """
  def format_info(message), do: format(IO.ANSI.blue() <> "@info", message)
end
