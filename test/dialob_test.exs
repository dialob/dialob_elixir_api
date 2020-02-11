defmodule DialobTest do
  use ExUnit.Case
  doctest Dialob

  test "greets the world" do
    assert Dialob.hello() == :world
  end
end
