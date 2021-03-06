alias IO.ANSI, as: A

defmodule PrefixFormatter do
  @moduledoc """
  Prettify question, info and error message (using a prefix) and some colors
  """

  @doc """
  Format a message with a prefix and a message. Add a line break

  ## Examples

      iex> PrefixFormatter.format("?", "How old are you")
      "? How old are you"

  """
  @spec format(String.t(), String.t()) :: String.t()
  def format(prefix, message) do
    ~s/#{A.bright()}#{prefix}#{A.reset()}#{A.white()}#{A.bright()} #{message}#{A.reset()}\n/
  end

  @doc """
  Format to a pretty question

  ## Examples

      iex> PrefixFormatter.format_quest("How old are you")
      "@quest:: How old are you"

  """
  @spec format_quest(String.t()) :: String.t()
  def format_quest(message), do: format(A.green() <> "@quest::", message)

  @doc """
  Format to a pretty error

  ## Examples

      iex> PrefixFormatter.format_err("Something is wrong !")
      "@quest:: Something is wrong !"

  """
  @spec format_err(String.t()) :: String.t()
  def format_err(message), do: format(A.red() <> "@err::", message)

  @doc """
  Format to a pretty info

  ## Examples

      iex> PrefixFormatter.format_info("Something is happening !")
      "@info:: Something is happening !"

  """
  @spec format_info(String.t()) :: String.t()
  def format_info(message), do: format(A.blue() <> "@info::", message)
end
