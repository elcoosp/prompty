defmodule PromptyTest do
  use ExUnit.Case
  doctest Prompty

  test "greets the world" do
    assert Prompty.hello() == :world
  end
end
