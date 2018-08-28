alias IO.ANSI, as: A

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
  @spec format(String.t(), String.t()) :: String.t()
  def format(prefix, message) do
    ~s/#{A.bright()}#{prefix}#{A.reset()}#{A.white()}#{A.bright()} #{message}#{A.reset()}\n/
  end

  @doc """
  Format to a pretty question

  ## Examples

      iex> PrefixFormatter.format_question("How old are you")
      "@quest:: How old are you"
  """
  @spec format_question(String.t()) :: String.t()
  def format_question(message), do: format(A.green() <> "@quest::", message)

  @doc """
  Format to a pretty error

  ## Examples

    iex> PrefixFormatter.format_error("Something is wrong !")
    "@quest:: Something is wrong !"
  """
  @spec format_error(String.t()) :: String.t()
  def format_error(message), do: format(A.red() <> "@err::", message)

  @doc """
  Format to a pretty info

  ## Examples

    iex> PrefixFormatter.format_info("Something is happening !")
    "@info:: Something is happening !"
  """
  @spec format_info(String.t()) :: String.t()
  def format_info(message), do: format(A.blue() <> "@info::", message)
end
