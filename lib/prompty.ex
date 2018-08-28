import PrefixFormatter

defmodule Prompty do
  @moduledoc """
  Bunch of helpers to prompt questions and print infos and errors in a pretty fahsion
  """
  @type handler() :: (String.t() -> any)

  @doc """
  Pormpt a question and return the user input

  ## Examples

      iex> Prompty.prompt("How old are you")
      "@quest:: How old are you"

  """
  @spec prompt(String.t()) :: String.t()
  def prompt(question), do: IO.gets(format_quest(question))

  @doc """
  Prompt and call the false_handler while the predicate does not return true. Otherwise call the true_handler and stop prompting.
  Handlers are passed the raw response (with a new line at the end)

  ## Examples

      iex> Prompty.prompt_while(
          &(&1 === "a"),
          fn x -> Prompty.print_info("Success") end,
          fn x -> Prompty.print_error("Oops") end,
          "Say a"
        )
      "Some loop"

  """
  @spec prompt_while((String.t() -> boolean), handler, handler, String.t()) :: :ok
  def prompt_while(predicate, true_handler, false_handler, question) do
    input = prompt(question)

    case predicate.(input) do
      true ->
        true_handler.(input)

      false ->
        false_handler.(input)
        prompt_while(predicate, true_handler, false_handler, question)
    end
  end

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
