for n <- [1, 2, 3, 4], do: n * n

# pattern matching inside generators also works
values = [good: 1, good: 2, bad: 3, good: 4]
for {:good, n} <- values, do: n * n


# multiple generators with Enums + Streams 
dirs = ['../config']
for dir  <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path) do
      File.stat!(path)
end

# cartesian product with generators
for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}

# bitstring generators
pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
for <<r::8, g::8, b::8 <- pixels>>, do: IO.inspect {r, g, b}

#In the examples above, all the comprehensions returned lists as their result. 
#However, the result of a comprehension can be inserted into different data structures by passing the :into option to the comprehension.

for <<c <- " hello world ">>, c != ?\s, into: "", do: IO.inspect <<c>>
# In general, :into accepts any structure that implements the Collectable protocol.

for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: IO.inspect {key, val * val}

#Since the IO module provides streams (that are both Enumerables and Collectables), 
#an echo terminal that echoes back the upcased version of whatever is typed can be implemented using comprehensions

# stream = IO.stream(:stdio, :line)
# for line <- stream, into: stream do String.upcase(line) <> "\n" end