import PrefixFormatter

defmodule Prompty do
  @moduledoc """
  Bunch of helpers to prompt questions and print infos and errors in a pretty fahsion
  """

  @doc """
  Pormpt a question and return the user input

  ## Examples

      iex> Prompty.prompt("How old are you")
      "@quest:: How old are you"

  """
  @spec prompt(String.t()) :: String.t()
  def prompt(question), do: IO.gets(format_quest(question))

  @doc """
  Print an error

  ## Examples

  	iex> Prompty.print_error("Nice error")
  	"@err:: Nice error"

  """
  @spec print_error(String.t()) :: :ok
  def print_error(error), do: IO.write(:stdio, format_err(error))

  @doc """
  Print an info

  ## Examples

    	iex> Prompty.print_info("Wonderful info")
  		"@info:: Wonderful info"

  """
  @spec print_info(String.t()) :: :ok
  def print_info(info), do: IO.write(:stdio, format_info(info))
end
