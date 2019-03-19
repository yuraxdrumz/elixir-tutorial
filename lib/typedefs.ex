defmodule LousyCalculator do
  @typedoc """
  Just a number followed by a string.
  """
  @type number_with_remark :: {number, String.t}

  @spec add(number, number) :: number_with_remark
  def add(x, y), do: {x + y, "You need a calculator to do that?"}

  @spec multiply(number, number) :: number_with_remark
  def multiply(x, y), do: {x * y, "It is like addition on steroids."}
end

a = LousyCalculator.add(1,2)

IO.inspect(a)

# Defining behaviours
defmodule Parser do
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}
  @callback extensions() :: [String.t]
end

defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some json " <> str} # ... parse JSON
  
  @impl Parser
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some yaml " <> str} # ... parse YAML
  
  @impl Parser
  def extensions, do: ["yml"]
end

a = "{a: 2}"

IO.inspect JSONParser.parse(a)

#Behaviours are frequently used with dynamic dispatching. 
#For example, we could add a parse! function to the Parser module that dispatches to the given implementation and returns the :ok result 
#or raises in cases of :error:

# defmodule Parser do
#   @callback parse(String.t) :: {:ok, term} | {:error, String.t}
#   @callback extensions() :: [String.t]

#   def parse!(implementation, contents) do
#     case implementation.parse(contents) do
#       {:ok, data} -> data
#       {:error, error} -> raise ArgumentError, "parsing error: #{error}"
#     end
#   end
# end
