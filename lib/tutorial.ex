
require User

defmodule Tutorial do
  @moduledoc """
  Documentation for Tutorial.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Tutorial.hello()
      :world

  """
  def hello do
    a = %User{name: "yura", age: 10}
    IO.inspect Size.size(a)
    :world
  end
end

Tutorial.hello
