defmodule SharaBackendTest do
  use ExUnit.Case
  doctest SharaBackend

  test "greets the world" do
    assert SharaBackend.hello() == :world
  end
end
