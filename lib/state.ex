# # State

# # We haven’t talked about state so far in this guide. If you are building an application that requires state, for example, to keep your application configuration, or you need to parse a file and keep it in memory, where would you store it?

# # Processes are the most common answer to this question. We can write processes that loop infinitely, maintain state, and send and receive messages. As an example, let’s write a module that starts new processes that work as a key-value store in a file named kv.exs:

# defmodule KV do
#   def start_link do
#     Task.start_link(fn -> loop(%{}) end)
#   end

#   defp loop(map) do
#     receive do
#       {:get, key, caller} ->
#         send caller, Map.get(map, key)
#         loop(map)
#       {:put, key, value} ->
#         loop(Map.put(map, key, value))
#     end
#   end
# end

# {:ok, pid} = KV.start_link
# send pid, {:put, :hello, "lala"}
# send pid, {:get, :hello, self()}

# receive do 
#   msg -> IO.puts("Received message: #{inspect(msg)}")
#   after 1_200 -> IO.puts("Done listening")
# end