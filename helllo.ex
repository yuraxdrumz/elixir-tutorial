#
# Elixir projects are usually organized into three directories:
#
#    ebin - contains the compiled bytecode
#    lib - contains elixir code (usually .ex files)
#    test - contains tests (usually .exs files)
#

IO.puts "Hello world from Elixir"
IO.puts 1+2
IO.puts div(10, 5)
IO.puts 0b1010 / 2
IO.puts "This is a symbol(atom)(const) #{:hello}"
IO.puts "bytes: #{byte_size("This is a symbol(atom)(const) #{:hello}")}"

add = fn a,b -> a+b end

IO.puts add.(1,3)

double = fn c -> add.(c, c) end

IO.puts double.(5)

[1, 2, true, 3]
[1, true, 2, false, 3, true] -- [true, false]
{:ok, "hello"}

IO.puts "this is string concat #{"foo" <> "bar"}"

IO.puts 'hello' == "hello"

# number < atom < reference < function < port < pid < tuple < map < list < bitstring


# the same - use the ^ when yo uwant to pattern match, otherwise, reassigning is done like this: x = 2
# x = 1
# 2 = x
# ^x = 2

case {2,2,2,3} do
  {3,4,5} ->
    IO.puts "will not match"
  {2,2,2} ->
    IO.puts "will not match as well"
  _ -> 
    IO.puts "will match everything"
end

x = 1

case {2, x, 2} do
  {3, 4, 5} ->
    IO.puts "will not match"
  {2, x, 2} when x > 0 ->
    IO.puts "will match everything"
end

f = fn 
  x, y when x > 0 and y > 0 -> x + y
  x, y -> x * y
end

IO.puts f.(1,2)
IO.puts f.(-2, 6)


cond do
  2 + 2 == 5 ->
    IO.puts "This will not be true"
  2 * 2 == 3 ->
    IO.puts "Nor this"
  1 + 1 == 2 ->
    IO.puts "But this will"
end

# Since we have characters like ł assigned to the code point 322, 
# we actually need more than one byte to represent them. 
# That’s why we see a difference when we calculate the byte_size/1 of a string compared to its String.length/1:
string = "hełło"
IO.puts byte_size(string)
IO.puts String.length(string)

# get a chars code
IO.puts ?a

IO.puts "hełło" <> <<0>>

"he" <> rest = "hello"
IO.puts rest

# "" is a string
# '' is a char list
a = 'hello'
b = "hello"

IO.puts is_list(a)
IO.puts is_list(b)

list = [{:a, 1}, {:b, 2}]

IO.puts list == [a: 1, b: 2]

list ++ [c: 3]

# will return true because all data types are immutable in elixir!
IO.puts list == [a: 1, b: 2]

# map
map = %{:a => 1, 2 => :b}

# pattern matching on a map
%{:a => a} = map
%{} = map
IO.puts a

# update map
#returns a new map
new_map = %{map | 2 => "NEW"}


%{2 => v} = new_map

IO.puts v

users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]

IO.puts users[:john].age

# update age
new_users = put_in users[:john].age, 31

IO.puts new_users[:john].age

# define your own module like this:
defmodule Math do
  def sum(a, b) do
    a + b
  end
end

Math.sum(2,2)

defmodule DefaultTest do
  def dowork(x \\ "hello") do
    x
  end
end

IO.puts DefaultTest.dowork
IO.puts DefaultTest.dowork "12312"

defmodule Recursion do
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end

  def print_multiple_times(msg, n) do
    IO.puts msg
    print_multiple_times(msg, n - 1)
  end
end

Recursion.print_multiple_times("Hello!", 3)

# https://elixir-lang.org/getting-started/recursion.html - continue

Enum.map(1..3, fn x -> x * 2 end)

total_sum = 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.sum

IO.puts total_sum

#As an alternative to Enum, Elixir provides the Stream module which supports lazy operations:

stream_sum = 1..100_000 |> Stream.map(&(&1 * 3)) |> Enum.sum

IO.puts stream_sum
