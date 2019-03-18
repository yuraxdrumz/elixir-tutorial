
# # bubbling of errors, stop work in main process
# pid = spawn_link fn -> raise "oops" end
# # seperate process error, continue work in main process
# pid = spawn fn -> raise "oops" end

# IO.puts Process.alive?(pid)

# send self(), {:hello, "dd"}

# receive do
#   {:hello, "world"} ->
#     IO.puts "cool"
#   # _ -> 
#   #   IO.puts "default"
#     # code
#     after 1_000 -> 
#       IO.puts "nothing..."
# end

