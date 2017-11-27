defmodule GoTest do
  use ExUnit.Case
  doctest Go

  test "greets the world" do
    assert Go.hello() == :world
  end
end
